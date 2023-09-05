import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class RepairProvider extends ChangeNotifier{

  Future<void> moreRepair() async {
    final Uri url = Uri.parse("https://zippyindia.in/#/repair");
    if (!await launchUrl(url,mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

}