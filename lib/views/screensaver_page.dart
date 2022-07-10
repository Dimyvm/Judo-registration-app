import 'package:JudoRegistration/routes.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ScreensaverPage extends StatefulWidget {
  const ScreensaverPage({Key? key}) : super(key: key);

  @override
  State<ScreensaverPage> createState() => _ScreensaverPageState();
}

class _ScreensaverPageState extends State<ScreensaverPage> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/videos/screensaverJudoTielt.mp4");
    _controller.addListener(() { setState(() {}); });
        _initializeVideoPlayerFuture =  _controller.initialize().then((_) {
            _controller.play();
            _controller.setLooping(true);
            _controller.setVolume(0.0);
            setState(() {});
          });
  }
  

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // VideoPlayerController _controller;
    // Future<void> _initializeVideoPlayerFuture;
    // _controller =
    //     VideoPlayerController.asset('assets/video/screensaver Judo Tielt.mp4');
    // _initializeVideoPlayerFuture = _controller.initialize();
    // _controller.setLooping(true);
    // _controller.setVolume(0.0);
    // _controller.play();

    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, Routes.pageHome);
        },
        child: Center(
          // child: SizedBox(
          //     width: double.infinity,
          //     height: double.infinity,
          //     child: Image.asset('assets/images/screensaver.png', fit: BoxFit.cover,)),
          // child: AspectRatio(
          //   aspectRatio: _controller.value.aspectRatio,
          // child: VideoPlayer(_controller),
          // ),

          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return VideoPlayer(_controller);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ),
    );
  }
}
