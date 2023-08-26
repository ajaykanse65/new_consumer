import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/email_password_auth_provider.dart';
import '../../screen_content/authScreenContent/email_password_create_content.dart';


class EmailPasswordCreateScreen extends StatefulWidget {
  const EmailPasswordCreateScreen({super.key});

  @override
  State<EmailPasswordCreateScreen> createState() => _EmailPasswordCreateScreenState();
}

class _EmailPasswordCreateScreenState extends State<EmailPasswordCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmailPasswordAuthProvider(),
      child: const EmailPasswordCreateScreenContent()
    );
  }
}
