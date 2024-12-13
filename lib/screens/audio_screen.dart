import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  final List<Map<String, String>> audioFiles = [
    {
      'title': 'Relaxing Music',
      'file_path':
          'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3'
    },
    {
      'title': 'Motivational Speech',
      'file_path':
          'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3'
    },
    // Add more audio data here
  ];

  final Map<int, AudioPlayer> _audioPlayers = {};

  @override
  void dispose() {
    // Dispose all audio players when leaving the screen
    _audioPlayers.forEach((key, player) => player.dispose());
    super.dispose();
  }

  Future<void> _playAudio(int index, String filePath) async {
    if (!_audioPlayers.containsKey(index)) {
      _audioPlayers[index] = AudioPlayer();
    }

    final player = _audioPlayers[index]!;

    if (player.playing) {
      await player.stop();
    } else {
      try {
        await player.setUrl(filePath);
        await player.play();
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error playing audio: $e')),
        );
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: audioFiles.length,
          itemBuilder: (context, index) {
            final audio = audioFiles[index];
            final player = _audioPlayers[index];
            final isPlaying = player?.playing ?? false;

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: ListTile(
                leading: Icon(
                  isPlaying ? Icons.pause_circle : Icons.play_circle,
                  size: 40,
                  color: Colors.orange,
                ),
                title: Text(
                  audio['title']!,
                  style: const TextStyle(fontSize: 18),
                ),
                onTap: () {
                  _playAudio(index, audio['file_path']!);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}