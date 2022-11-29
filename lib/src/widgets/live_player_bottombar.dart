import 'package:flutter/material.dart';
import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';
import 'package:lecle_yoyo_player/src/widgets/widget_bottombar.dart';
import 'package:video_player/video_player.dart';

/// typedef function for skip buttons
// typedef SkipButtonCallback = void Function(VideoPlayerValue? value);

class LiveTvPlayerBottomBar extends StatelessWidget {
  /// Constructor
  const LiveTvPlayerBottomBar({
    Key? key,
    required this.controller,
    required this.showBottomBar,
    this.onPlayButtonTap,
    this.videoDuration = "00:00:00",
    this.videoSeek = "00:00:00",
    this.videoStyle = const VideoStyle(),
    this.onFastForward,
    this.onRewind,
    required this.toggleFullScreen,
  }) : super(key: key);

  /// The controller of the playing video.
  final VideoPlayerController controller;

  /// If set to [true] the bottom bar will appear and if you want that user can not interact with the bottom bar you can set it to [false].
  /// Default value is [true].
  final bool showBottomBar;

  /// The text to display the current position progress.
  final String videoSeek;

  /// The text to display the video's duration.
  final String videoDuration;

  /// The callback function execute when user tapped the play button.
  final void Function()? onPlayButtonTap;

  /// The model to provide custom style for the video display widget.
  final VideoStyle videoStyle;

  /// The callback function execute when user tapped the rewind button.
  final SkipButtonCallback? onRewind;

  /// The callback function execute when user tapped the forward button.
  final SkipButtonCallback? onFastForward;

  final VoidCallback toggleFullScreen;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: showBottomBar,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 2,
                    horizontal: 4,
                  ),
                  margin: const EdgeInsets.only(top: 3, right: 5),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: const Text(
                    'Live',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      VideoProgressIndicator(
                        controller,
                        allowScrubbing: false,
                        colors: videoStyle.progressIndicatorColors ??
                            const VideoProgressColors(
                              playedColor: Colors.red,
                              backgroundColor: Colors.red,
                              bufferedColor: Colors.red,
                            ),
                        padding: videoStyle.progressIndicatorPadding ??
                            EdgeInsets.zero,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                InkWell(
                  onTap: toggleFullScreen,
                  child: const Icon(
                    Icons.fullscreen,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
