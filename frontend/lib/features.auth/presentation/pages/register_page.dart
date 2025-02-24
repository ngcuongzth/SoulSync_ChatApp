import 'package:flutter/material.dart';
import 'package:soul_app/features.auth/presentation/widgets/auth_button.dart';
import 'package:soul_app/features.auth/presentation/widgets/auth_input_field.dart';

import 'package:soul_app/features.auth/presentation/widgets/register_prompt.dart';

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
              AuthInputField(
                  hint: 'Username',
                  icon: Icons.person,
                  controller: _usernameController,
                  isPassword: false),
              SizedBox(height: 20),
              AuthInputField(
                  hint: 'Email',
                  icon: Icons.email,
                  controller: _emailController,
                  isPassword: false),
              SizedBox(height: 20),
              AuthInputField(
                  hint: 'Password',
                  icon: Icons.password,
                  controller: _passwordController,
                  isPassword: true),
              SizedBox(height: 20),
              AuthButton(text: 'Register', onPressed: _onRegisterTapped),
              SizedBox(height: 20),
              RegisterPrompt(
                title: "Already have an account. ",
                subtitle: "Click here to login",
                onRegister: _onRegisterTapped,
              )
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
}
