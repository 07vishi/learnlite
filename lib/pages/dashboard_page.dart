import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    final categories = [
      '3D Design',
      'Arts & Humanities',
      'Graphic Design',
      'Web Development',
      'SEO & Marketing',
    ];

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
                    children: const [
                      Text(
                        'Hi, User',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'What Would you like to learn Today?\nSearch Below',
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_none_rounded,
                      size: 28,
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Notifications tapped!')),
                      );
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
                    'Polupar Courses',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('See all courses!')),
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
              // Courses List
              SizedBox(
                height: 300,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: courses.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    return GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${course['title']} tapped!')),
                        );
                      },
                      child: Container(
                        width: 260,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Placeholder for video/image
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(18),
                                topRight: Radius.circular(18),
                              ),
                              child: course['localVideo'] != null &&
                                      course['localVideo'] != ''
                                  ? LocalVideoPlayer(assetPath: course['localVideo'] as String)
                                  : Container(
                                      height: 110,
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
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    course['category'] as String,
                                    style: const TextStyle(
                                      color: Color(0xFF2563EB),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    course['title'] as String,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
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
                                      const Spacer(),
                                      IconButton(
                                        icon: const Icon(Icons.bookmark_border),
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
                                    ]
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
              const SizedBox(height: 24),
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
