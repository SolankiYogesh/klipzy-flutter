import 'package:flutter/material.dart';

import 'package:klikli/screens/home_screen/widgets/video_player.dart';
import 'package:klikli/services/pageview_physics.dart';
import 'package:klikli/services/reels_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int currentPage = 0;
  final List<String> reels = ReelService().getReels();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: currentPage);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollBehavior: const ScrollBehavior(),
        physics: const PageViewScrollPhysics(),
        scrollDirection: Axis.vertical,
        controller: _pageController,
        itemCount: reels.length,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return VideoPlayerWidget(
            key: Key(reels[index]),
            reelUrl: reels[index],
          );
        },
      ),
    );
  }
}
