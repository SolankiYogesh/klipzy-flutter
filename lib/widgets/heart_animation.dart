import 'package:flutter/material.dart';

class HeartAnimation extends StatefulWidget {
  const HeartAnimation({super.key, required this.onClose, required this.emoji});

  final Function onClose;
  final String emoji;

  @override
  State<HeartAnimation> createState() => _HeartAnimationState();
}

class _HeartAnimationState extends State<HeartAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    // Set up the animation controller
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Set up the scale animation using TweenSequence
    _scaleAnimation = TweenSequence<double>([
      TweenSequenceItem(
        tween: Tween<double>(begin: 1, end: 1.5),
        weight: 1,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 1.5, end: 1),
        weight: 1,
      ),
    ]).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    // Add a listener to handle animation completion
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Animation has completed, call the onAnimationEnd function
        widget.onClose();
      }
    });

    // Start the entry animation when the widget is built
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          top: (MediaQuery.of(context).size.height - 100) / 2,
          left: (MediaQuery.of(context).size.width - 100) / 2,
          child: Transform.scale(
            scale: _scaleAnimation.value,
            child: Image.asset(widget.emoji, width: 100, height: 100),
          ),
        );
      },
    );
  }
}
