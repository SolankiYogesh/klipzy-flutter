import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:klikli/widgets/app_input.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFF5F5F5),
        child: const SafeArea(
          child: Column(
            children: [
              Text(
                "Welcome Back",
                style: TextStyle(
                  color: Color(0xFF222222),
                ),
              ),
              AppInput(
                placeHolder: "Enter Email Address",
              ),
              AppInput(
                placeHolder: "Enter Password",
                isPassword: true,
              )
            ],
          ),
        ),
      ),
    );
  }
}
