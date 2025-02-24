import 'package:flutter/material.dart';
import 'package:soul_app/core/theme.dart';
import 'package:soul_app/features.auth/presentation/widgets/auth_button.dart';
import 'dart:developer';

import 'package:soul_app/features.auth/presentation/widgets/auth_input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
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
                "Login",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center,
              ),
              Text(
                "Your Conversations Await – Sign In Now!",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(fontStyle: FontStyle.italic, letterSpacing: 0.7),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 15),
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
              _buildLoginButton(context),
              SizedBox(height: 20),
              _buildRegisterPrompt(context)
            ],
          ),
        ),
      ),
    );
  }

  void _onLoginTapped() {
    String emailValue = _emailController.value.text.trim();
    String passwordValue = _passwordController.value.text.trim();

    final payloadLogin = {
      'email': emailValue,
      'password': passwordValue,
    };

    print(payloadLogin);
  }

  Widget _buildTextInput(
      context, String hint, IconData icon, TextEditingController controller,
      {bool isPassword = false}) {
    return AuthInputField(
        hint: hint, icon: icon, controller: controller, isPassword: isPassword);
  }

  Widget _buildLoginButton(context) {
    // return ElevatedButton(
    //   onPressed: _onLoginTapped,
    //   style: ElevatedButton.styleFrom(
    //       backgroundColor: DefaultColors.buttonColor,
    //       shape:
    //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
    //       padding: EdgeInsets.symmetric(vertical: 14)),
    //   child: Text(
    //     'Login',
    //     style: TextStyle(color: Colors.grey),
    //   ),
    // );
    return AuthButton(text: 'Login', onPressed: _onLoginTapped);
  }

  Widget _buildRegisterPrompt(context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          log('Login Tapped!');
        },
        child: RichText(
          text: TextSpan(
              text: "Don't have an account? ",
              style: TextStyle(
                color: Colors.grey,
              ),
              children: [
                TextSpan(
                    text: "Sign up here",
                    style: TextStyle(color: Colors.blueAccent))
              ]),
        ),
      ),
    );
  }
}
