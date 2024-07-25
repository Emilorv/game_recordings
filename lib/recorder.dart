import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class Recorder extends StatefulWidget {
  final Record record;
  bool isRecording;
  String path;

  Recorder(
      {super.key,
      required this.record,
      required this.isRecording,
      required this.path});

  @override
  RecorderState createState() => RecorderState();
}

class RecorderState extends State<Recorder> {
  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(widget.isRecording ? Icons.stop : Icons.mic),
          iconSize: 64.0,
          onPressed: _toggleRecording,
        ),
        Text(widget.isRecording ? 'Recording...' : 'Press to Record'),
      ],
    );
  }

  Future<void> _toggleRecording() async {
    try {
      if (widget.isRecording) {
        _stopRecording();
      } else {
        _startRecording();
      }
    } catch (e) {
      if (kDebugMode) {
        print('Could not toggle recording : $e');
      }
    }
  }

  Future<void> _startRecording() async {
    if (await widget.record.hasPermission()) {
      await widget.record.start();
    }
    setState(() {
      widget.isRecording = true;
    });
  }

  Future<void> _stopRecording() async {
    String? path = await widget.record.stop();
    setState(() {
      widget.isRecording = false;
      widget.path = path!;
    });
  }
}
