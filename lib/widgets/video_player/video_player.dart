import 'package:anilibria_clone/constants.dart';
import 'package:anilibria_clone/models/article/article.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';
import 'package:wakelock/wakelock.dart';

@RoutePage(name: 'VideoAppRouter')
class VideoApp extends StatefulWidget {
  final Article article;

  const VideoApp({super.key, required this.article});

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(
        mediaUrl + widget.article.player.list.episodes.first.hls.sd,
      ),
    )
      ..addListener(() => setState(() {}))
      ..setLooping(false)
      ..setVolume(100)
      ..initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    setAllOrientations();
    super.dispose();
  }

  Future setAllOrientations() async {
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    
    await Wakelock.disable();
  }

  Future setLandscape() async {
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    await Wakelock.enable();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _controller.value.isPlaying
              ? _controller.pause()
              : _controller.play();
        });
      },
      child: Center(
        child: _controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    VideoPlayer(_controller),
                    VideoProgressIndicator(_controller, allowScrubbing: true),
                  ],
                ),
              )
            : Container(),
      ),
    );
  }
}
