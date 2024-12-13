//import 'package:flutter/material.dart';

// class VideosScreen extends StatefulWidget {
  // const VideosScreen({super.key});

  // @override
  // _VideosScreenState createState() => _VideosScreenState();
 //}

// class _VideosScreenState extends State<VideosScreen> {
//   late VideoPlayerControll _controller;
//   late Future<void> _initializeVideoPlayerFuture;
  
//   @override
//   void dispose() {
//     _controller.dispose();  // Dispose of the controller when screen is disposed
//     super.dispose();
//   }

//   // Function to initialize the video controller
//   Future<void> _initializeController(String videoUrl) async {
//     _controller = VideoPlayerController.network(videoUrl); // Or use .asset() if the video is locally stored
//     _initializeVideoPlayerFuture = _controller.initialize();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Sample video data
//     List<Map<String, String>> videos = [
//       {
//         'title': 'Sample Video 1',
//         'url': 'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'
//       },
//       {
//         'title': 'Sample Video 2',
//         'url': 'https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4'
//       },
//       // Add more video data here
//     ];

//     return Scaffold(
//       body: SafeArea(
//         child: ListView.builder(
//           itemCount: videos.length,
//           itemBuilder: (context, index) {
//             final video = videos[index];

//             return Card(
//               margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       video['title']!,
//                       style: const TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     AspectRatio(
//                       aspectRatio: 16 / 9,
//                       child: Container(
//                         decoration: BoxDecoration(
//                           color: Colors.black12,
//                           borderRadius: BorderRadius.circular(8),
//                         ),
//                         child: _controller.value.isInitialized
//                             ? GestureDetector(
//                                 onTap: () {
//                                   if (_controller.value.isPlaying) {
//                                     _controller.pause();
//                                   } else {
//                                     _controller.play();
//                                   }
//                                   setState(() {});
//                                 },
//                                 child: VideoPlayer(_controller),
//                               )
//                             : Center(child: CircularProgressIndicator()),
//                       ),
//                     ),
//                     const SizedBox(height: 8),
//                     ElevatedButton(
//                       onPressed: () {
//                         _initializeController(video['url']!);
//                       },
//                       child: const Text('Play'),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
