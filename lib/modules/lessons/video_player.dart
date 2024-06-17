import 'package:flutter/material.dart';
import 'package:medilearnpro/shared/models/lessons/video_lessons_model.dart';
import 'package:medilearnpro/shared/utils/styles.dart';
import 'package:medilearnpro/shared/widgets/custom_appbar.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoId;
  final Snippet snippet;

  const VideoPlayerScreen(
      {Key? key, required this.videoId, required this.snippet})
      : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(
          context: context,
          hasLeading: true,
          title: Styles.medium(widget.snippet.title!)),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressIndicatorColor: Colors.blueAccent,
      ),
    );
  }
}
