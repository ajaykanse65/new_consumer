import 'package:flutter/material.dart';
import 'package:new_consumer/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import '../../screen_content/authScreenContent/login_screen_content.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const  LoginScreenContent(),

    );
  }
}
