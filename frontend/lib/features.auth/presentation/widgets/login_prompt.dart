import 'package:flutter/material.dart';

class LoginPrompt extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onLogin;
  const LoginPrompt(
      {super.key,
      required this.title,
      required this.onLogin,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onLogin,
        child: RichText(
          text: TextSpan(
              text: title,
              style: TextStyle(
                color: Colors.grey,
              ),
              children: [
                TextSpan(
                    text: subtitle, style: TextStyle(color: Colors.blueAccent))
              ]),
        ),
      ),
    );
  }
}
