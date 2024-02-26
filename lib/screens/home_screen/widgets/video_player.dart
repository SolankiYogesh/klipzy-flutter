import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:klikli/config/cache_config.dart';
import 'package:klikli/widgets/emoji_container.dart';
import 'package:klikli/widgets/heart_animation.dart';
import 'package:klikli/widgets/volume_container.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String reelUrl;

  const VideoPlayerWidget({
    super.key,
    required this.reelUrl,
  });

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget>
    with WidgetsBindingObserver {
  VideoPlayerController? _controller;
  bool isHeart = false;
  bool isMuted = false;
  bool isVolumeHandler = false;

  String? emoji;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initializeController();
  }

  bool _videoInitialized = false;

  initializeController() async {
    var fileInfo = await kCacheManager.getFileFromCache(widget.reelUrl);
    if (fileInfo == null) {
      await kCacheManager.downloadFile(widget.reelUrl);
      fileInfo = await kCacheManager.getFileFromCache(widget.reelUrl);
    }
    if (mounted) {
      _controller = VideoPlayerController.file(fileInfo!.file)
        ..initialize().then((_) {
          setState(() {
            _controller!.setLooping(true); // Set video to loop
            _controller!.play();
            _videoInitialized = true;
          });
        });
      _controller!.addListener(() {
        if (_controller!.value.isPlaying && !_isPlaying) {
          // Video has started playing
          setState(() {
            _isPlaying = true;
          });
        }
      });
    }
  }

  bool _isPlaying = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      // App is in the foreground
      _controller!.play();
    } else if (state == AppLifecycleState.inactive) {
      // App is partially obscured
      _controller!.pause();
    } else if (state == AppLifecycleState.paused) {
      // App is in the background
      _controller!.pause();
    } else if (state == AppLifecycleState.detached) {
      // App is terminated
      _controller!.dispose();
    }
  }

  @override
  void dispose() {
    log('disposing a controller');
    if (mounted && _controller != null) {
      _controller!.dispose();
    } // Dispose of the controller when done
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;
    return Stack(
      children: [
        GestureDetector(
          onDoubleTap: () {
            setState(() {
              isHeart = true;
            });
          },
          onLongPressStart: (lng) {
            if (_videoInitialized) {
              setState(() {
                if (_controller!.value.isPlaying) {
                  _controller!.pause();
                  _isPlaying = false;
                } else {
                  _controller!.play();
                  _isPlaying = true;
                }
              });
            }
          },
          onLongPressEnd: (lng) {
            if (_videoInitialized) {
              setState(() {
                if (_controller!.value.isPlaying) {
                  _controller!.pause();
                  _isPlaying = false;
                } else {
                  _controller!.play();
                  _isPlaying = true;
                }
              });
            }
          },
          behavior: HitTestBehavior.opaque,
          onTap: () {
            if (_videoInitialized && _controller != null) {
              setState(() {
                if (!isMuted) {
                  _controller!.setVolume(0.0);
                  isMuted = true;
                  isVolumeHandler = true;
                } else {
                  _controller!.setVolume(1.0);
                  isMuted = false;
                  isVolumeHandler = true;
                }
              });
            }
          },
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              !_videoInitialized
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Center(
                      child: Transform.scale(
                        scale: _controller!.value.aspectRatio / deviceRatio,
                        child: AspectRatio(
                          aspectRatio: _controller!.value.aspectRatio,
                          child: VideoPlayer(_controller!),
                        ),
                      ),
                    ),
              !_videoInitialized
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : const SizedBox(),
              if (isHeart && emoji != null)
                HeartAnimation(
                  key: Key(emoji!),
                  emoji: emoji!,
                  onClose: () {
                    setState(() {
                      isHeart = false;
                      emoji = null;
                    });
                  },
                ),
              if (isVolumeHandler)
                VolumeContainer(
                    key: Key(isMuted.toString()),
                    isMuted: isMuted,
                    onClose: () {
                      setState(() {
                        isVolumeHandler = false;
                      });
                    }),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  !_videoInitialized
                      ? const SizedBox()
                      : VideoProgressIndicator(
                          _controller!,
                          allowScrubbing: false,
                          colors: const VideoProgressColors(
                            playedColor: Colors.white,
                            bufferedColor: Colors.grey,
                            backgroundColor: Colors.white,
                          ),
                        ),
                  EmojiContainer(
                    onPress: (String emoji) {
                      setState(() {
                        this.emoji = emoji;
                        isHeart = true;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
        ),
        // here you can add title, user Info,
        // description, views count etc.
      ],
    );
  }
}
