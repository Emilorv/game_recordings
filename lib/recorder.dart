import 'package:flutter/material.dart';
import 'package:record/record.dart';

class Recorder extends StatefulWidget {
  final Function(String) onStop;
  final AudioRecorder record;

  const Recorder({super.key, required this.record, required this.onStop});

  @override
  RecorderState createState() => RecorderState();
}

class RecorderState extends State<Recorder> {
  bool isRecording = false;

  @override


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(isRecording ? Icons.stop : Icons.mic),
          iconSize: 64.0,
          onPressed: _toggleRecording,
        ),
        Text(isRecording ? 'Recording...' : 'Press to Record'),
      ],
    );
  }

  void _toggleRecording() async {
    if (isRecording) {
      final path = await record.stop();
      widget.onStop(path!);
      setState(() {
        isRecording = false;
      });
    } else {
      await record.start();
      setState(() {
        isRecording = true;
      });
    }
  }
}