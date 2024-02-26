import 'package:flutter/material.dart';
import 'package:klikli/helpers/images.dart';

class EmojiContainer extends StatelessWidget {
  const EmojiContainer({super.key, this.onPress});

  final void Function(String emoji)? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.4)),
      width: double.infinity, // Set the width to 100%
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () => onPress!(Images.cuteAnimated),
            child: Image.asset(Images.cute, width: 35, height: 35),
          ),
          InkWell(
            onTap: () => onPress!(Images.emojiAnimated),
            child: Image.asset(Images.emoji, width: 35, height: 35),
          ),
          InkWell(
            onTap: () => onPress!(Images.heartAnimated),
            child: Image.asset(Images.heart, width: 35, height: 35),
          ),
          InkWell(
            onTap: () => onPress!(Images.partyAnimated),
            child: Image.asset(Images.party, width: 35, height: 35),
          ),
          InkWell(
            onTap: () => onPress!(Images.sadAnimated),
            child: Image.asset(Images.sad, width: 35, height: 35),
          ),
          InkWell(
            onTap: () => onPress!(Images.smileAnimated),
            child: Image.asset(Images.smile, width: 35, height: 35),
          ),
        ],
      ),
    );
  }
}
