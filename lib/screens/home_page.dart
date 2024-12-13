import 'package:flutter/material.dart';
import 'package:unisda/screens/audio_screen.dart';
import 'package:unisda/screens/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Pages for each tab
  final List<Widget> _pages = [
    const HomeScreen(),
    const Center(
        child: Text('Videos Page Content', style: TextStyle(fontSize: 24))),
    const AudioScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _pages[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        iconSize: 28,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: "Videos",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.audiotrack),
            label: "Audios",
          ),
        ],
      ),
    );
  }
}
