import 'package:flutter/material.dart';
import 'package:new_consumer/providers/process_providers.dart';
import 'package:new_consumer/providers/shield_providers.dart';
import 'package:new_consumer/screen_content/processScreenContent/select_device_screen_content.dart';
import 'package:provider/provider.dart';

class SelectDeviceScreen extends StatefulWidget {
  final bool shield;
  const SelectDeviceScreen({super.key, required this.shield});

  @override
  State<SelectDeviceScreen> createState() => _SelectDeviceScreenState();
}

class _SelectDeviceScreenState extends State<SelectDeviceScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> ProcessProviders()),
        ListenableProvider(create: (context)=> ShieldProviders())
      ],
      child:   SelectDeviceScreenContent(isShield: widget.shield,),
    );  }
}
