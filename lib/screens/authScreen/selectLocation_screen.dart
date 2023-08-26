import 'package:flutter/material.dart';
import 'package:new_consumer/screen_content/authScreenContent/selectLocation_screen_content.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const  SelectLocationScreenContent(),

    );
  }
}
