import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_consumer/screens/authScreen/otp_screen.dart';


class AuthProvider extends ChangeNotifier{
  bool _hideWan = true;
  TextEditingController mobileNo = TextEditingController();
  final List<TextEditingController> otpControllers = List.generate(4, (index) => TextEditingController(),);
  FocusNode? focusNode;
  String contactNo = '';
  Timer? _timer;
  int _secondsRemaining = 60;
  int get secondsRemaining => _secondsRemaining;

  bool get isHidden => _hideWan;
  String get isContactNo => contactNo;
  bool get areAllOTPsFilled => otpControllers.every((controller) => controller.text.isNotEmpty);




  void setHidden(){
    _hideWan = false;
    notifyListeners();
  }


  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        _secondsRemaining--;
        notifyListeners(); // Notify listeners to update UI
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _secondsRemaining = 00;
    notifyListeners(); // Notify listeners to update UI
  }

  Future<void> sendOTP(BuildContext context)async{
    contactNo = mobileNo.text;
    Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(mobileN0: mobileNo.text)));
    notifyListeners();
  }
  @override
  void dispose() {
    _timer?.cancel();
    for (final controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}