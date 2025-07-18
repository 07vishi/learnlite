import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String? _selectedGender;
  final _formKey = GlobalKey<FormState>();
  DateTime? _selectedDate;
  File? _profileImage;

  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  @override
  void dispose() {
    _dobController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _profileImage = File(picked.path);
      });
    }
  }

  Future<void> _pickDate(BuildContext context) async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime(now.year - 18, now.month, now.day),
      firstDate: DateTime(1900),
      lastDate: now,
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dobController.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Profile Picture with Edit Icon
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 48,
                    backgroundColor: Colors.white,
                    backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                    child: _profileImage == null
                        ? Icon(Icons.person, size: 56, color: Colors.grey[400])
                        : null,
                  ),
                  Positioned(
                    bottom: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green, width: 2),
                        ),
                        child: const Icon(Icons.image, color: Colors.green, size: 24),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Full Name
              TextFormField(
                controller: _fullNameController,
                decoration: _inputDecoration('Full Name'),
                validator: (v) => v == null || v.isEmpty ? 'Enter full name' : null,
              ),
              const SizedBox(height: 16),
              // Nick Name
              TextFormField(
                decoration: _inputDecoration('Nick Name'),
              ),
              const SizedBox(height: 16),
              // Date of Birth
              TextFormField(
                controller: _dobController,
                decoration: _inputDecoration('Date of Birth').copyWith(
                  suffixIcon: const Icon(Icons.calendar_today_outlined, color: Colors.black38),
                ),
                readOnly: true,
                onTap: () => _pickDate(context),
                validator: (v) => v == null || v.isEmpty ? 'Select date of birth' : null,
              ),
              const SizedBox(height: 16),
              // Email
              TextFormField(
                decoration: _inputDecoration('Email').copyWith(
                  suffixIcon: const Icon(Icons.email_outlined, color: Colors.black38),
                ),
                validator: (v) => v == null || v.isEmpty ? 'Enter email' : null,
              ),
              const SizedBox(height: 16),
              // Phone (with flag)
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                child: Row(
                  children: [
                    // Flag
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(
                        'https://flagcdn.com/w20/pt.png', // Portugal flag
                        width: 28,
                        height: 20,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '(+351 ) 987-848-1225',
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Gender Dropdown
              DropdownButtonFormField<String>(
                decoration: _inputDecoration('Gender'),
                value: _selectedGender,
                items: ['Male', 'Female', 'Other']
                    .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                    .toList(),
                onChanged: (val) => setState(() => _selectedGender = val),
                validator: (v) => v == null || v.isEmpty ? 'Select gender' : null,
              ),
              const SizedBox(height: 16),
              // Student
              TextFormField(
                decoration: _inputDecoration('Student'),
              ),
              const SizedBox(height: 32),
              // Update Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      final name = _fullNameController.text.trim();
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Profile updated!')),
                      );
                      Future.delayed(const Duration(milliseconds: 500), () {
                        Navigator.pop(context, name); // Pass the name back
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2563EB),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Update',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 12),
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.white,
                        child: Icon(Icons.arrow_forward, color: Color(0xFF2563EB)),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => EditProfilePage()));
          },
          child: const Text('Edit Profile'),
        ),
      ),
    );
  }
}