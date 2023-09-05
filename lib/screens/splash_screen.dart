import 'package:flutter/material.dart';
import 'package:new_consumer/providers/auth_provider.dart';
import 'package:new_consumer/screen_content/splash_screen_content.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => AuthProvider(),
      child: const SplashScreenContent(),
    );
  }
}






