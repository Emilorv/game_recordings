
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';
import 'recorder.dart';
import 'audio_player.dart';


class RecordingsScreen extends StatelessWidget {
  final String folderName;

  const RecordingsScreen({super.key, required this.folderName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(folderName)),
      body: const Center(child: Text('Recording List Here')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RecordingScreen(folderName: folderName),
            ),
          );
        },
        child: const Icon(Icons.mic),
      ),
    );
  }
}

class RecordingScreen extends StatefulWidget {
  final String folderName;

  const RecordingScreen({super.key, required this.folderName});

  @override
  RecordingScreenState createState() => RecordingScreenState();
}

class RecordingScreenState extends State<RecordingScreen> {
  late Record audioRecord;
  late AudioPlayer audioPlayer;
  bool showPlayer = false;
  bool isRecording = false;
  String? audioPath;

  @override
  void initState(){
    audioPlayer = AudioPlayer();
    audioRecord = Record();
    super.initState();
  }

  @override
  void dispose() {
    audioRecord.dispose();
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: showPlayer
              ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: AudioPlayerWidget(
              source: audioPath!,
              onDelete: () {
                setState(() => showPlayer = false);
              },
            ),
          )
              : Recorder( record: audioRecord, isRecording: isRecording, path: "./lib/bip",
          ),
        ),
      ),
    );
  }
}