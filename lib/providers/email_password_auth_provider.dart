import 'package:flutter/material.dart';

class EmailPasswordAuthProvider  extends ChangeNotifier{
  final bool _validate = false;
  bool passwordVisible=false;

  bool get visibility => passwordVisible;
  bool get isValidate => _validate;

  void passwordVisibility(){
    passwordVisible = !passwordVisible;
    notifyListeners();
  }
  void setVisible(BuildContext context){
    FocusScope.of(context).unfocus();
    notifyListeners();
  }
}