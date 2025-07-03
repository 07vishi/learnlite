import 'package:flutter/material.dart';
// Import your home page or dashboard

class AllCategoryPage extends StatelessWidget {
  final List<Map<String, dynamic>> categories = [
    {'icon': Icons.view_in_ar, 'label': '3D Design'},
    {'icon': Icons.brush, 'label': 'Graphic Design'},
    {'icon': Icons.web, 'label': 'Web Development'},
    {'icon': Icons.trending_up, 'label': 'SEO & Marketing'},
    {'icon': Icons.account_balance, 'label': 'Finance & Accounting'},
    {'icon': Icons.bar_chart, 'label': 'Personal Development'},
    {'icon': Icons.settings, 'label': 'Office Productivity'},
    {'icon': Icons.group, 'label': 'HR Management'},
  ];

  AllCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F8FA),
      appBar: AppBar(
        backgroundColor: Color(0xFFF7F8FA),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'All Category',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Column(
          children: [
            // Search bar
            Container(
              margin: EdgeInsets.only(bottom: 24),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for..',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFF2563EB),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: IconButton(
                      icon: Icon(Icons.search, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            // Category grid
            Expanded(
              child: GridView.builder(
                itemCount: categories.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 28,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.2,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        padding: EdgeInsets.all(18),
                        child: Icon(
                          categories[index]['icon'],
                          size: 48,
                          color: Color(0xFF2563EB),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        categories[index]['label'],
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}