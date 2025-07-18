import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'edit_profile_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String userName = 'User'; // Default

  @override
  Widget build(BuildContext context) {
    final categories = ['3D Design', 'Graphic Design', 'Web Development'];

    final courses = [
      {
        'title': 'Graphic Design Advanced',
        'category': 'Graphic Design',
        'price': '850/-',
        'rating': 4.2,
        'students': 7830,
      },
      {
        'title': 'Advertisement Design',
        'category': 'Graphic Design',
        'price': '400/-',
        'rating': 4.0,
        'students': 3200,
      },
      {
        'title': 'Web Development Bootcamp',
        'category': 'Web Development',
        'price': '1200/-',
        'rating': 4.8,
        'students': 15000,
        'localVideo': 'assets/videos/my_course.mp4',
      },
      {
        'title': 'SEO Mastery Course',
        'category': 'SEO & Marketing',
        'price': '600/-',
        'rating': 4.5,
        'students': 5000,
      },
      {
        'title': 'Digital Marketing Essentials',
        'category': 'SEO & Marketing',
        'price': '700/-',
        'rating': 4.3,
        'students': 4000,
      },
      {
        'title': '3D Animation Basics',
        'category': '3D Design',
        'price': '900/-',
        'rating': 4.6,
        'students': 2500,
      },
      {
        'title': 'Art History Overview',
        'category': 'Arts & Humanities',
        'price': '300/-',
        'rating': 4.1,
        'students': 1800,
      },
      {
        'title': 'Offline Flutter Course',
        'category': 'Flutter',
        'price': 'FREE',
        'rating': 5.0,
        'students': 9999,
        // Add 'localVideo': 'assets/videos/my_course.mp4', if you want to show a local video
      },
      {
        'title': 'Your New Course',
        'category': 'Web Development',
        'price': '1000/-',
        'rating': 4.7,
        'students': 5000,
        'localVideo':
            'assets/videos/your_new_video.mp4', // Add your video path here
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, $userName',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        'What Would you like to learn Today?\nSearch Below',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.account_circle,
                      size: 32,
                      color: Color(0xFF2563EB),
                    ),
                    onPressed: () async {
                      final updatedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfilePage(),
                        ),
                      );
                      if (updatedName != null &&
                          updatedName is String &&
                          updatedName.isNotEmpty) {
                        setState(() {
                          userName = updatedName;
                        });
                      }
                    },
                  ),
                ],
              ),
              const SizedBox(height: 18),
              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search for..',
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.tune, color: Color(0xFF2563EB)),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Filter tapped!')),
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              // Special Offer Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF2563EB),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      '25% OFF*',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Today's Special",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      'Get a Discount for Every Course Order only Valid for Today.!',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              // Categories Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('See all categories!')),
                      );
                    },
                    child: const Text(
                      'SEE ALL',
                      style: TextStyle(
                        color: Color(0xFF2563EB),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              // Categories Chips
              SizedBox(
                height: 36,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    return ActionChip(
                      label: Text(categories[index]),
                      backgroundColor: index == 0
                          ? const Color(0xFF2563EB)
                          : const Color(0xFFE8EFFF),
                      labelStyle: TextStyle(
                        color: index == 0
                            ? Colors.white
                            : const Color(0xFF2563EB),
                        fontWeight: FontWeight.w500,
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${categories[index]} tapped!'),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 18),
              // Popular Courses Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Popular Courses',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              AllCoursesPage(courses: courses),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_forward,
                      color: Color(0xFF2563EB),
                      size: 18,
                    ),
                    label: const Text(
                      'SEE ALL',
                      style: TextStyle(
                        color: Color(0xFF2563EB),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Courses List
              SizedBox(
                height: 340,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: courses.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 18),
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    return GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${course['title']} tapped!')),
                        );
                      },
                      child: Container(
                        width: 270,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(22),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 12,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Video/Image area
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(22),
                                topRight: Radius.circular(22),
                              ),
                              child:
                                  course['localVideo'] != null &&
                                      course['localVideo'] != ''
                                  ? LocalVideoPlayer(
                                      assetPath: course['localVideo'] as String,
                                    )
                                  : Container(
                                      height: 130,
                                      color: Colors.black12,
                                      child: const Center(
                                        child: Icon(
                                          Icons.play_circle_fill,
                                          color: Color(0xFF2563EB),
                                          size: 56,
                                        ),
                                      ),
                                    ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    course['category'] as String,
                                    style: const TextStyle(
                                      color: Color(0xFF2563EB),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    course['title'] as String,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black87,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 4,
                                        ),
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFE8EFFF),
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                        child: Text(
                                          course['price'] as String,
                                          style: const TextStyle(
                                            color: Color(0xFF2563EB),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 18,
                                          ),
                                          Text(
                                            '${course['rating']}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        '${course['students']} Std',
                                        style: const TextStyle(
                                          color: Colors.black54,
                                          fontSize: 13,
                                        ),
                                      ),
                                      const Spacer(),
                                      IconButton(
                                        icon: Icon(
                                          Icons.bookmark,
                                          color: Colors.grey[400],
                                        ),
                                        onPressed: () {
                                          ScaffoldMessenger.of(
                                            context,
                                          ).showSnackBar(
                                            SnackBar(
                                              content: Text(
                                                'Bookmarked ${course['title']}!',
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}

class LocalVideoPlayer extends StatefulWidget {
  final String assetPath;
  const LocalVideoPlayer({required this.assetPath, super.key});

  @override
  State<LocalVideoPlayer> createState() => _LocalVideoPlayerState();
}

class _LocalVideoPlayerState extends State<LocalVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.assetPath)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: Stack(
              alignment: Alignment.center,
              children: [
                VideoPlayer(_controller),
                IconButton(
                  icon: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause_circle
                        : Icons.play_circle,
                    size: 48,
                    color: Colors.white70,
                  ),
                  onPressed: () {
                    setState(() {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    });
                  },
                ),
              ],
            ),
          )
        : Container(
            height: 110,
            color: Colors.black12,
            child: const Center(child: CircularProgressIndicator()),
          );
  }
}

class AllCoursesPage extends StatelessWidget {
  final List<Map<String, dynamic>> courses;

  const AllCoursesPage({required this.courses, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Courses'),
        backgroundColor: const Color(0xFF2563EB),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: courses.length,
          separatorBuilder: (_, __) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final course = courses[index];
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
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
                  // Placeholder for video/image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child:
                        course['localVideo'] != null &&
                            course['localVideo'] != ''
                        ? LocalVideoPlayer(
                            assetPath: course['localVideo'] as String,
                          )
                        : Container(
                            width: 100,
                            height: 100,
                            color: Colors.black12,
                            child: const Center(
                              child: Icon(
                                Icons.play_circle_fill,
                                color: Color(0xFF2563EB),
                                size: 48,
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course['title'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          course['category'] as String,
                          style: const TextStyle(
                            color: Color(0xFF2563EB),
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              course['price'] as String,
                              style: const TextStyle(
                                color: Color(0xFF2563EB),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(width: 8),
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            Text(
                              '${course['rating']}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '${course['students']} Std',
                              style: const TextStyle(
                                color: Colors.black54,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
