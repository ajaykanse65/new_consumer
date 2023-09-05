import 'package:flutter/material.dart';
import 'package:new_consumer/providers/shield_providers.dart';
import 'package:new_consumer/screen_content/shieldScreenContent/shiedlHome_screen_content.dart';
import 'package:provider/provider.dart';

class ShieldHomeScreen extends StatefulWidget {
  const ShieldHomeScreen({super.key});

  @override
  State<ShieldHomeScreen> createState() => _ShieldHomeScreenState();
}

class _ShieldHomeScreenState extends State<ShieldHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=> ShieldProviders(),
      child:  const ShieldHomeScreenContent(),
    );
  }
}
