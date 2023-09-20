import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class imageSorce extends StatefulWidget {
  final String url;

  const imageSorce({Key? key, required this.url}) : super(key: key);

  @override
  State<imageSorce> createState() => _imageSorceState();
}

class _imageSorceState extends State<imageSorce> {
  @override
  Widget build(BuildContext context) {
    return Image.network(widget.url);
  }
}

class vdoSorce extends StatefulWidget {
  final String url;

  const vdoSorce({Key? key, required this.url}) : super(key: key);

  @override
  State<vdoSorce> createState() => _vdoSorceState();
}

class _vdoSorceState extends State<vdoSorce> {
  VideoPlayerController? controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.network(widget.url)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..setVolume(0.5)
      ..initialize().then((_) => controller!.play());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: controller!.value.aspectRatio,
        child: VideoPlayer(controller!));
  }
}


