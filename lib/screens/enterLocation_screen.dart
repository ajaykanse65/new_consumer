import 'package:flutter/material.dart';
import 'package:new_consumer/providers/auth_provider.dart';
import 'package:new_consumer/providers/location_providers.dart';
import 'package:new_consumer/screen_content/enterLocation_screen_content.dart';
import 'package:provider/provider.dart';


class EnterLocationScreen extends StatefulWidget {
  const EnterLocationScreen({super.key});

  @override
  State<EnterLocationScreen> createState() => _EnterLocationScreenState();
}

class _EnterLocationScreenState extends State<EnterLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LocationProvider()),
      ListenableProvider(create: (context) => AuthProvider())
    ],
    child:  const EnterLocationScreenContent(),);
  }
}
