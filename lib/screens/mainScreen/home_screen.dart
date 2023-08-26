import 'package:flutter/material.dart';
import 'package:new_consumer/providers/home_providers.dart';
import 'package:new_consumer/screen_content/mainScreenContent/home_screen_content.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
        ListenableProvider(create: (context) => AuthProvider())
      ],
      child: const  HomeScreenContent(),

    );
  }
}

