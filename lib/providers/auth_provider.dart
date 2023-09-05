import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:new_consumer/screens/authScreen/email_password_login_screen.dart';
import 'package:new_consumer/screens/authScreen/login_screen.dart';
import 'package:new_consumer/screens/authScreen/otp_screen.dart';
import 'package:new_consumer/screens/mainScreen/home_screen.dart';
import 'package:new_consumer/test_file.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';



class AuthProvider extends ChangeNotifier{
  bool _validate = false;
  final bool _isLoading = true;
  String name = "Add Address";
  String currentAddress = "Enable Location or enter manually";
  Position? _currentPosition;
  bool _hideWan = true;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  // bool isNavigate = true;
  TextEditingController mobileNo = TextEditingController();

  final List<TextEditingController> otpControllers = List.generate(4, (index) => TextEditingController(),);
  FocusNode? focusNode;
  String contactNo = '';
  Timer? _timer;
  int _secondsRemaining = 59;
  int get secondsRemaining => _secondsRemaining;

  bool get isHidden => _hideWan;
  // bool get isNav => isNavigate;
  bool get isValidate => _validate;
  bool get loading => _isLoading;
  GlobalKey<FormState> get formKey => _formkey;
  String get address => currentAddress;
  String get userName => name;
  bool get areAllOTPsFilled => otpControllers.every((controller) => controller.text.isNotEmpty);


  Future<void> checkUser(BuildContext context) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences = await SharedPreferences.getInstance();
    var UserID = preferences.getString('otp');
    print(UserID);
    if (UserID == null || UserID == '') {
      Timer(const Duration(seconds: 3),
              ()=>
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginScreen())
              )
      );

      // print('In If');
      // Timer(const Duration(seconds: 3),
      //         ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignIn())
      //     )
      // );
    }else{
      // print('In Else');
      Timer(const Duration(seconds: 3),
              ()=>
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen())
              )
      );

    }
  }




  void setHidden(){
    _hideWan = false;
    notifyListeners();
  }



  // void unSetLocation(){
  //   isNavigate = true;
  //   notifyListeners();
  // }
  //
  //
  // void setLocation(){
  //   isNavigate = false;
  //   notifyListeners();
  // }

  void setVisible(BuildContext context){
    _hideWan = true;
    FocusScope.of(context).unfocus();
    notifyListeners();
  }

  // void skipMethod(){
  //   // _isLoading = false;
  //   _isNavigate = false;
  //   notifyListeners();
  // }


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
    if(_formkey.currentState!.validate()){
      contactNo = "+91 ${mobileNo.text}";
      showModalBottomSheet(
        isDismissible: false,
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

    var status = await Permission.locationWhenInUse.status;
    if(status != PermissionStatus.granted){
      return;
    }else{
      getCurrentPosition();

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



  Future<void>  getPermission(BuildContext context) async{

    PermissionStatus permissionGranted;
    permissionGranted = await Permission.location.request();
    // permissionGranted = await Permission.camera.request();
    // permissionGranted = await Permission.storage.request();
    // permissionGranted = await Permission.photos.request();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await Permission.location.request();
      // permissionGranted = await Permission.camera.request();
      // permissionGranted = await Permission.storage.request();
      // // permissionGranted = await Permission.photos.request();

      // if (permissionGranted != PermissionStatus.granted) {
      //   print('object');
      //   if (!context.mounted) return;
      //   Navigator.pushReplacementNamed(context, '/home');
      //   notifyListeners();
      //   return;
      // }
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

      currentAddress = '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      name = "Mathew";
      print(currentAddress);
      // _isLoading = false;
      notifyListeners();
    }).catchError((e) {
      debugPrint(e.toString());
    });
  }
}