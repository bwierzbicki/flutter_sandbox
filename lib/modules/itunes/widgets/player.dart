import 'dart:async';
import 'dart:ui';

import 'package:audio/audio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/player_provider.dart';

class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  PlayerProvider _playerProvider;
  Audio audioPlayer = new Audio(single: true);
  AudioPlayerState state = AudioPlayerState.STOPPED;
  double position = 0;
  String currentSongUrl;
  StreamSubscription<AudioPlayerState> _playerStateSubscription;
  StreamSubscription<double> _playerPositionController;

  @override
  void initState() {
    _playerProvider = Provider.of<PlayerProvider>(context, listen: false);

    _playerStateSubscription =
        audioPlayer.onPlayerStateChanged.listen((AudioPlayerState state) {
      if (mounted) setState(() => this.state = state);
    });

    _playerPositionController =
        audioPlayer.onPlayerPositionChanged.listen((double position) {
      if (mounted) setState(() => this.position = position);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _playerProvider = Provider.of<PlayerProvider>(context);

    if (currentSongUrl != _playerProvider.songUrl) {
      audioPlayer.stop();
      audioPlayer.play(_playerProvider.songUrl);
      currentSongUrl = _playerProvider.songUrl;
    }

    Widget status = Container();

    print(
        "[build] uid=${audioPlayer.uid} duration=${audioPlayer.duration} state=$state");

    switch (state) {
      case AudioPlayerState.LOADING:
        {
          status = Container(
            padding: const EdgeInsets.all(12.0),
            child: Container(
                child: Center(
                  child: CircularProgressIndicator(strokeWidth: 2.0),
                ),
                width: 24.0,
                height: 24.0),
          );
          break;
        }

      case AudioPlayerState.PLAYING:
        {
          status = IconButton(
            icon: Icon(
              Icons.pause,
              size: 28.0,
            ),
            onPressed: onPause,
          );
          break;
        }

      case AudioPlayerState.READY:
      case AudioPlayerState.PAUSED:
      case AudioPlayerState.STOPPED:
        {
          status = IconButton(
            icon: Icon(
              Icons.play_arrow,
              size: 28.0,
            ),
            onPressed: onPlay,
          );

          if (state == AudioPlayerState.STOPPED) audioPlayer.seek(0.0);

          break;
        }
    }

    return Container(
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          if (_playerProvider.imageUrl != null)
            Opacity(
              opacity: 0.5,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(_playerProvider.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 0,
                ),
                width: double.infinity,
                height: 50,
              ),
            ),
          ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaY: 2,
                sigmaX: 2,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  status,
                  Expanded(
                    child: Slider(
                      max: audioPlayer.duration.toDouble(),
                      value: position.toDouble(),
                      onChanged: onSeek,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 10,
                    ),
                    child: Text(
                      "${audioPlayer.duration.toDouble() / 1000}s",
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _playerStateSubscription.cancel();
    _playerPositionController.cancel();
    audioPlayer.release();
    super.dispose();
  }

  onPlay() {
    audioPlayer.play(_playerProvider.songUrl);
  }

  onPause() {
    audioPlayer.pause();
  }

  onSeek(double value) {
    // Note: We can only seek if the audio is ready
    audioPlayer.seek(value);
  }
}
