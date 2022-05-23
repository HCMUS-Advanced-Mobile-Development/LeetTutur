import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:leet_tutur/models/tutor.dart';
import 'package:leet_tutur/widgets/error_page.dart';
import 'package:video_player/video_player.dart';

class TutorVideo extends StatefulWidget {
  final Tutor tutor;

  const TutorVideo({Key? key, required this.tutor}) : super(key: key);

  @override
  State<TutorVideo> createState() => _TutorVideoState();
}

class _TutorVideoState extends State<TutorVideo> {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: FutureBuilder(
          future: _setUpController(),
          builder: (context, AsyncSnapshot<ChewieController?> snapshot) {
            if (snapshot.hasData) {
              return Chewie(
                controller: snapshot.data ?? chewieController,
              );
            } else if (snapshot.hasError) {
              return const ErrorPage();
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Future<ChewieController> _setUpController() async {
    videoPlayerController =
        VideoPlayerController.network(widget.tutor.video ?? "");
    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
    );

    return chewieController;
  }
}
