import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String source;
  final VoidCallback onDelete;

  const AudioPlayerWidget({super.key, required this.source, required this.onDelete});

  @override
  AudioPlayerWidgetState createState() => AudioPlayerWidgetState();
}

class AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(
          icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
          iconSize: 64.0,
          onPressed: _togglePlayPause,
        ),
        Text(isPlaying ? 'Playing...' : 'Press to Play'),
        IconButton(
          icon: Icon(Icons.delete),
          onPressed: widget.onDelete,
        ),
      ],
    );
  }

  void _togglePlayPause() {
    if (isPlaying) {
      _audioPlayer.pause();
      setState(() {
        isPlaying = false;
      });
    } else {
      _audioPlayer.play(DeviceFileSource(widget.source));
      setState(() {
        isPlaying = true;
      });
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
