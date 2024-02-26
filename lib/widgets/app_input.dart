import 'package:flutter/material.dart';

class AppInput extends StatefulWidget {
  const AppInput({super.key, this.placeHolder = "", this.isPassword = false});

  final String? placeHolder;
  final bool? isPassword;

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  bool isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isVisible = widget.isPassword == true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF0F0D23),
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(32)),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Flexible(
            child: TextField(
              decoration: InputDecoration.collapsed(
                border: InputBorder.none,
                hintText: widget.placeHolder,
              ),
              obscureText: isVisible,
              enableSuggestions: widget.isPassword == false,
              autocorrect: widget.isPassword == false,
            ),
          ),
          if (widget.isPassword == true)
            InkWell(
              onTap: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              child: Icon(isVisible ? Icons.visibility_off : Icons.visibility),
            )
        ],
      ),
    );
  }
}
