import 'package:flutter/material.dart';

class VolumeContainer extends StatelessWidget {
  const VolumeContainer({
    super.key,
    required this.isMuted,
    required this.onClose,
  });

  final bool isMuted;
  final void Function() onClose;

  @override
  Widget build(BuildContext context) {
    // Delayed invocation of onClose function after 1500 milliseconds
    Future.delayed(const Duration(milliseconds: 1500), onClose);

    return Positioned(
      top: (MediaQuery.of(context).size.height - 100) / 2,
      left: (MediaQuery.of(context).size.width - 100) / 2,
      child: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.4),
          borderRadius: BorderRadius.all(Radius.circular(300)),
        ),
        width: 100,
        height: 100,
        child: Icon(
          isMuted ? Icons.volume_off : Icons.volume_up,
          color: Colors.white,
          size: 60.0,
        ),
      ),
    );
  }
}
