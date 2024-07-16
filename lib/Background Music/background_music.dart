import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class SoundListTile extends StatefulWidget {
  @override
  _SoundListTileState createState() => _SoundListTileState();
}

class _SoundListTileState extends State<SoundListTile> {
  bool isPlaying = true;
  final BackgroundMusic backgroundMusic = BackgroundMusic();

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Sound'),
      trailing: IconButton(
        onPressed: () async {
          setState(() {
            isPlaying = !isPlaying;
          });
          if (isPlaying) {
            await backgroundMusic.stopMusic();
          } else {
            await backgroundMusic.playingMusic();
          }
        },
        icon: Icon(
          isPlaying ? Icons.volume_off_sharp : Icons.volume_up_sharp,
        ),
      ),
    );
  }
}

class BackgroundMusic {
  final audioPlayer = AudioPlayer();
  bool _isPlaying = false;

  Future<void> playingMusic() async {
    await audioPlayer.play(AssetSource('sounds/2.mp3'));
    audioPlayer.setReleaseMode(ReleaseMode.loop);
    _isPlaying = true;
  }

  Future<void> stopMusic() async {
    await audioPlayer.stop();
    _isPlaying = false;
  }
}
