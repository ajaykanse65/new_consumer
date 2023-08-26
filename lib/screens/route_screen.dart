import 'package:flutter/material.dart';
import 'package:new_consumer/providers/route_provider.dart';
import 'package:new_consumer/screen_content/route_screen_content.dart';
import 'package:provider/provider.dart';


class RouteScreen extends StatefulWidget {
  const RouteScreen({super.key});

  @override
  State<RouteScreen> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RouteProvider(),
      child: const  RouteScreenContent(),
    );
  }
}
