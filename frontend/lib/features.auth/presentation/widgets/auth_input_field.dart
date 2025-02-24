import 'package:flutter/material.dart';
import 'package:soul_app/core/theme.dart';

class AuthInputField extends StatelessWidget {
  final String hint;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;

  const AuthInputField(
      {super.key,
      required this.hint,
      required this.icon,
      required this.controller,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: DefaultColors.sentMessageInput,
            borderRadius: BorderRadius.circular(25)),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey,
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextField(
                controller: controller,
                obscureText: isPassword,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                  border: InputBorder.none,
                ),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            )
          ],
        ));
  }
}
