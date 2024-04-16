import 'package:flutter/material.dart';
import 'package:flutter_chat/src/components/text_button_custom.dart';
import 'package:flutter_chat/src/components/text_field_custom.dart';
import 'package:flutter_chat/src/services/auth/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final AuthService _authService = AuthService();

  void signUp() {
    _authService.createUser(emailController.text, passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
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
                  hintText: 'email',
                  controller: emailController),
              const SizedBox(
                height: 10,
              ),
              TextFieldCustom(
                  obscureText: true,
                  hintText: 'password',
                  controller: passwordController),
              const SizedBox(
                height: 10,
              ),
              TextFieldCustom(
                  obscureText: true,
                  hintText: 'confirm password',
                  controller: confirmPasswordController),
              const SizedBox(
                height: 40,
              ),
              TextButtonCustom(onTap: signUp, text: 'Register'),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Already a member? ',
                  ),
                  GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        'Login now',
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
