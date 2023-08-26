import 'package:flutter/material.dart';
import 'package:new_consumer/providers/email_password_auth_provider.dart';
import 'package:new_consumer/screen_content/authScreenContent/email_password_login_content.dart';
import 'package:provider/provider.dart';


class EmailPasswordLoginScreen extends StatefulWidget {
  const EmailPasswordLoginScreen({super.key});

  @override
  State<EmailPasswordLoginScreen> createState() => _EmailPasswordLoginScreenState();
}

class _EmailPasswordLoginScreenState extends State<EmailPasswordLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => EmailPasswordAuthProvider(),
      child: const EmailPasswordLoginScreenContent(),
    );
  }
}
