/* import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}/*  */

class _HomePageState extends State<HomePage> {
  final List<String> videoUrls = [
    // Replace with your own video URLs or asset paths
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4',
  ];

  final List<VideoPlayerController> _controllers = [];

  @override
  void initState() {
    super.initState();
    for (var url in videoUrls) {
      final controller = VideoPlayerController.network(url)
        ..initialize().then((_) {
          setState(() {});
        });
      _controllers.add(controller);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Learn Lite App'),
        centerTitle: true,
        backgroundColor: Colors.red,
        toolbarHeight: 60,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.settings), onPressed: () {}),
          IconButton(icon: Icon(Icons.account_circle), onPressed: () {}),
          IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        ],
        leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.red),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 173, 46, 14),
        unselectedItemColor: const Color.fromARGB(255, 168, 18, 18),
        onTap: (index) {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Featured Videos',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.red[800],
              ),
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: _controllers.length,
                itemBuilder: (context, index) {
                  final controller = _controllers[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: controller.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: controller.value.aspectRatio,
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                VideoPlayer(controller),
                                VideoProgressIndicator(controller, allowScrubbing: true),
                                Align(
                                  alignment: Alignment.center,
                                  child: IconButton(
                                    icon: Icon(
                                      controller.value.isPlaying
                                          ? Icons.pause_circle
                                          : Icons.play_circle,
                                      size: 48,
                                      color: Colors.white70,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        controller.value.isPlaying
                                            ? controller.pause()
                                            : controller.play();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            height: 200,
                            color: Colors.black12,
                            child: Center(child: CircularProgressIndicator()),
                          ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
} */