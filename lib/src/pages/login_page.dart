import 'package:flutter/material.dart';
import 'package:flutter_chat/src/components/text_button_custom.dart';
import 'package:flutter_chat/src/components/text_field_custom.dart';
import 'package:flutter_chat/src/services/auth/auth_service.dart';

class LoginPage extends StatelessWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    final AuthService _authService = AuthService();

    void sigIn() {
      _authService.sigInUser(emailController.text, passwordController.text);
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.chat,
                size: 100,
              ),
              const SizedBox(
                height: 30,
              ),
              TextFieldCustom(
                  obscureText: false,
                  hintText: 'Email',
                  controller: emailController),
              const SizedBox(
                height: 10,
              ),
              TextFieldCustom(
                  obscureText: true,
                  hintText: 'Password',
                  controller: passwordController),
              const SizedBox(
                height: 40,
              ),
              TextButtonCustom(onTap: sigIn, text: 'Login'),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member? ',
                  ),
                  GestureDetector(
                      onTap: onTap,
                      child: const Text(
                        'Register now',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
