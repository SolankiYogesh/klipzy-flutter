import 'dart:developer';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import '../config/cache_config.dart';

class ReelService {
// Here, I use some stock videos as an example.
// But you need to make this list empty when you will call api for your reels
  final _reels = <String>[
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/501.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/502.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/503.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/504.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/505.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/506.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/507.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/508.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/509.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/510.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/511.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/512.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/513.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/514.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/515.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/516.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/517.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/518.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/519.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/520.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/521.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/522.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/523.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/524.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/525.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/526.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/527.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/528.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/529.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/530.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/531.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/532.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/533.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/534.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/535.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/536.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/537.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/538.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/539.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/540.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/541.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/542.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/543.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/544.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/545.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/546.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/547.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/548.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/549.mp4",
    "https://d32r8fal0p61y.cloudfront.net/public/vSmallPosts/550.mp4",
  ];

  Future getVideosFromApI() async {
    // call your api here
    // then add all links to _reels variable
    for (var i = 0; i < _reels.length; i++) {
      cacheVideos(_reels[i], i);
      // you can add multiple logic for to cache videos. Right now I'm caching all videos
    }
  }

  cacheVideos(String url, int i) async {
    FileInfo? fileInfo = await kCacheManager.getFileFromCache(url);
    if (fileInfo == null) {
      log('downloading file ##------->$url##');
      await kCacheManager.downloadFile(url);
      log('downloaded file ##------->$url##');
      if (i + 1 == _reels.length) {
        log('caching finished');
      }
    }
  }

  List<String> getReels() {
    return _reels;
  }
}
