import 'package:flutter/widgets.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({Key? key, this.child, this.isSafeArea}) : super(key: key);
  final Widget? child;
  final bool? isSafeArea;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient:
            LinearGradient(colors: [Color(0xFF8E2DE2), Color(0xFF4A00E0)]),
      ),
      child: child,
    );
  }
}
