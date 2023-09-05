import 'package:flutter/material.dart';
import 'package:new_consumer/providers/repair_providers.dart';
import 'package:new_consumer/screen_content/repairScreenContent/repairHome_screen_content.dart';
import 'package:provider/provider.dart';

class RepairHomeScreen extends StatefulWidget {
  const RepairHomeScreen({super.key});

  @override
  State<RepairHomeScreen> createState() => _RepairHomeScreenState();
}

class _RepairHomeScreenState extends State<RepairHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RepairProvider(),
      child: const RepairHomeScreenContent(),
    );
  }
}
