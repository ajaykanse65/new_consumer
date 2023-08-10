import 'package:flutter/material.dart';
import 'package:new_consumer/providers/auth_provider.dart';
import 'package:new_consumer/screens/screen_content/authScreenContent/otp_screen_content.dart';
import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  final String mobileN0;

  const OtpScreen({super.key, required this.mobileN0});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child:  OtpScreenContent(mobileNumber: widget.mobileN0,),
    );
  }
}
