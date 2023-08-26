import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:new_consumer/screens/authScreen/otp_screen.dart';
import 'package:permission_handler/permission_handler.dart';



class AuthProvider extends ChangeNotifier{
  bool _validate = false;
  final bool _isLoading = true;
  String currentAddress = "Add your address";
  Position? _currentPosition;
  bool _hideWan = true;
  bool _isNavigate = false;
  TextEditingController mobileNo = TextEditingController();
  final List<TextEditingController> otpControllers = List.generate(4, (index) => TextEditingController(),);
  FocusNode? focusNode;
  String contactNo = '';
  Timer? _timer;
  int _secondsRemaining = 59;
  int get secondsRemaining => _secondsRemaining;

  bool get isHidden => _hideWan;
  bool get isNavigate => _isNavigate;
  bool get isValidate => _validate;
  bool get loading => _isLoading;
  String get isContactNo => contactNo;
  String get address => currentAddress;
  bool get areAllOTPsFilled => otpControllers.every((controller) => controller.text.isNotEmpty);




  void setHidden(){
    _hideWan = false;
    notifyListeners();
  }

  void setLocation(){
    _isNavigate = true;
    notifyListeners();
  }

  void unSetLocation(){
    _isNavigate = false;
    notifyListeners();
  }

  void setVisible(BuildContext context){
    _hideWan = true;
    FocusScope.of(context).unfocus();
    notifyListeners();
  }

  void skipMethod(){
    // _isLoading = false;
    _isNavigate = false;
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
  void restartTimer() {
    _secondsRemaining = 59;
    startTimer();
    notifyListeners();
  }



  void stopTimer() {
    _timer?.cancel();
    // _secondsRemaining = 00;
    notifyListeners(); // Notify listeners to update UI
  }

  Future<void> sendOTP(BuildContext context)async{
    mobileNo.text.length < 10 || mobileNo.text.isEmpty ? _validate = true : _validate = false;
    if(_validate == false){
      contactNo = mobileNo.text;
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return OtpScreen(mobileN0: contactNo,);
        },
      );
      // ModalBottomSheet.otpBottomSheet(context, contactNo);
      // Navigator.push(context, MaterialPageRoute(builder: (context) => OtpScreen(mobileN0: mobileNo.text)));
    }
    notifyListeners();
  }
  @override
  void dispose() {
    mobileNo.dispose();
    _timer?.cancel();
    for (final controller in otpControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> checkNavigation()async{
    if(_isNavigate == true){
      getCurrentPosition();
    }else{

    }
  }

  // Future<void> getLocation() async {
  //   _isNavigate = true;
  //   notifyListeners();
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   // Check if location services are enabled
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //   if (!serviceEnabled) {
  //     return;
  //   }
  //
  //   // Request location permission
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.deniedForever) {
  //     return;
  //   }
  //
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
  //       return;
  //     }
  //   }
  //
  //   // Get the current location
  //   // Position position = await Geolocator.getCurrentPosition(
  //   //   desiredAccuracy: LocationAccuracy.high,
  //   // );
  //   notifyListeners();
  // }



  Future<void>  getPermission() async{

    PermissionStatus permissionGranted;
    permissionGranted = await Permission.location.request();
    notifyListeners();
    // permissionGranted = await Permission.camera.request();
    // permissionGranted = await Permission.storage.request();
    // permissionGranted = await Permission.photos.request();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await Permission.location.request();
      notifyListeners();
      // permissionGranted = await Permission.camera.request();
      // permissionGranted = await Permission.storage.request();
      // permissionGranted = await Permission.photos.request();
      if (permissionGranted != PermissionStatus.granted) {
        notifyListeners();
        return;
      }
    }
  }


  Future<void> getCurrentPosition() async {
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      _currentPosition = position;
      _getAddressFromLatLng(_currentPosition!);
      notifyListeners();

    }).catchError((e) {
      debugPrint(e);
    });
  }

  Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
        _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];

      currentAddress =
      '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      print(currentAddress);
      // _isLoading = false;
      notifyListeners();
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }
}