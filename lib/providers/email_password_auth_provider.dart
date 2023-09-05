import 'package:flutter/material.dart';

import '../screens/authScreen/otp_screen.dart';

class EmailPasswordAuthProvider  extends ChangeNotifier{
  bool _emailValidate = false;
  bool _passwordValidate = false;
  bool _fnameValidate = false;
  bool _lnameValidate = false;
  bool passwordVisible=false;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  String emailId ='';

  bool get visibility => passwordVisible;
  bool get emailValidate => _emailValidate;
  GlobalKey<FormState> get formKey => _formkey;
  bool get passwordValidate => _passwordValidate;
  bool get fNameValidate => _fnameValidate;
  bool get lNameValidate => _lnameValidate;

  void passwordVisibility(){
    passwordVisible = !passwordVisible;
    notifyListeners();
  }
  void setVisible(BuildContext context){
    FocusScope.of(context).unfocus();
    notifyListeners();
  }

  Future<void> userLogin(BuildContext context) async{
    userPassword.text.isEmpty ? _passwordValidate = true : _passwordValidate = false;
    userEmail.text.isEmpty ? _emailValidate = true : _emailValidate = false;
    if(_formkey.currentState!.validate()){
      Navigator.pushReplacementNamed(context, '/home');
      // ModalBottomSheet.otpBottomSheet(context, contactNo);
      // Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(mobileN0: mobileNo.text)));
    }
    notifyListeners();
  }


  Future<void> userCreate(BuildContext context) async{
    userPassword.text.isEmpty ? _passwordValidate = true : _passwordValidate = false;
    userEmail.text.isEmpty ? _emailValidate = true : _emailValidate = false;
    firstName.text.isEmpty ? _fnameValidate = true : _fnameValidate = false;
    lastName.text.isEmpty ? _lnameValidate = true : _lnameValidate = false;
    if(_formkey.currentState!.validate()){
      emailId = userEmail.text;
      showModalBottomSheet(
        isDismissible: false,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return OtpScreen(mobileN0: emailId,);
        },
      );
      // ModalBottomSheet.otpBottomSheet(context, contactNo);
      // Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(mobileN0: mobileNo.text)));
    }
    notifyListeners();
  }
}