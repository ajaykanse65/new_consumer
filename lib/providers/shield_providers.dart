import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ShieldProviders extends ChangeNotifier{





  Future<void> moreShield() async {
    final Uri url = Uri.parse("https://zippyindia.in/#/shield");
    if (!await launchUrl(url,mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

}