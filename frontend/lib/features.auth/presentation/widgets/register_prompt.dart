import 'package:flutter/material.dart';

class RegisterPrompt extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onRegister;
  const RegisterPrompt(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.onRegister});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onRegister,
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
