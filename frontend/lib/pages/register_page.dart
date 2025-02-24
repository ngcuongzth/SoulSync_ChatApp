import 'package:flutter/material.dart';
import 'package:soul_app/core/theme.dart';
import 'dart:developer';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Register",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                "Chat Anytime, Anywhere",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontStyle: FontStyle.italic, letterSpacing: 0.7),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
              _buildTextInput(
                context,
                'Username',
                Icons.person,
                _usernameController,
              ),
              SizedBox(height: 20),
              _buildTextInput(
                context,
                'Email',
                Icons.email,
                _emailController,
              ),
              SizedBox(height: 20),
              _buildTextInput(
                context,
                'Password',
                Icons.password,
                _passwordController,
                isPassword: true,
              ),
              SizedBox(height: 20),
              _buildRegisterButton(context),
              SizedBox(height: 20),
              _buildLoginPromt(context)
            ],
          ),
        ),
      ),
    );
  }

  void _onRegisterTapped() {
    String usernameValue = _usernameController.value.text.trim();
    String emailValue = _emailController.value.text.trim();
    String passwordValue = _passwordController.value.text.trim();

    final payloadRegister = {
      'username': usernameValue,
      'email': emailValue,
      'password': passwordValue,
    };

    print(payloadRegister);
  }

  Widget _buildTextInput(
      context, String hint, IconData icon, TextEditingController controller,
      {bool isPassword = false}) {
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

  Widget _buildRegisterButton(context) {
    return ElevatedButton(
      onPressed: _onRegisterTapped,
      style: ElevatedButton.styleFrom(
          backgroundColor: DefaultColors.buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          padding: EdgeInsets.symmetric(vertical: 14)),
      child: Text(
        'Register',
        style: TextStyle(color: Colors.grey),
      ),
    );
  }

  Widget _buildLoginPromt(context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          log('Login Tapped!');
        },
        child: RichText(
          text: TextSpan(
              text: "Already have an account. ",
              style: TextStyle(
                color: Colors.grey,
              ),
              children: [
                TextSpan(
                    text: "Click here to login",
                    style: TextStyle(color: Colors.blueAccent))
              ]),
        ),
      ),
    );
  }
}
