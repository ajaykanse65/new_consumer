import 'package:flutter/material.dart';
import 'package:flutter_sequence_animation/flutter_sequence_animation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../static_data/assets_static.dart';

class SplashScreenContent extends StatefulWidget {
  const SplashScreenContent({super.key});

  @override
  State<SplashScreenContent> createState() => _SplashScreenContentState();
}

class _SplashScreenContentState extends State<SplashScreenContent>  with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late SequenceAnimation _sequenceAnimation;

  @override
  void initState() {
    super.initState();
    final myFormProvider = Provider.of<AuthProvider>(context, listen: false);
    // myFormProvider.checkUser(context);

    // Initialize the animation controller
    _controller = AnimationController(vsync: this);

    // Define the splash screen animation sequence
    _sequenceAnimation = SequenceAnimationBuilder()
        .addAnimatable(
      animatable: Tween<double>(begin: 1.0, end: 2.0),
      from: Duration.zero,
      to: const Duration(milliseconds: 800),
      tag: 'zoomOut',
    )
        .addAnimatable(
      animatable: Tween<double>(begin: 0.0, end: 1.0),
      from: const Duration(milliseconds: 800),
      to: const Duration(milliseconds: 1200),
      tag: 'fadeOut',
    )
        .animate(_controller);

    // Start the animation when the widget is built
    _controller.forward().whenComplete(() {
      // You can navigate to the next screen or perform other actions here
      // For example, Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E59B7), // Set your desired background color
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            final zoomOutValue = _sequenceAnimation['zoomOut'].value as double;
            final fadeOutValue = _sequenceAnimation['fadeOut'].value as double;

            // Calculate the position of the content to center it during zoom-out
            final dx = MediaQuery.of(context).size.width * 0.5 * (1 - zoomOutValue);
            final dy = MediaQuery.of(context).size.height * 0.5 * (1 - zoomOutValue);

            return Transform.translate(
              offset: Offset(dx, dy),
              child: Transform.scale(
                scale: zoomOutValue,
                child: Opacity(
                  opacity: 1 - fadeOutValue,
                  child: SvgPicture.asset(ImagePath.mainLogo), // Replace this with your splash screen content
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
