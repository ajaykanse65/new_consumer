// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MaterialApp(home: OTPPage()));
// }
//
// class OTPPage extends StatefulWidget {
//   @override
//   _OTPPageState createState() => _OTPPageState();
// }
//
// class _OTPPageState extends State<OTPPage> {
//   final List<TextEditingController> _otpControllers = List.generate(4, (index) => TextEditingController(),);
//
//   bool get areAllOTPsFilled => _otpControllers.every((controller) => controller.text.isNotEmpty);
//
//   @override
//   void dispose() {
//     for (final controller in _otpControllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('OTP Verification')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: List.generate(
//                 4,
//                     (index) => SizedBox(
//                   width: 50,
//                   child: TextField(
//                     controller: _otpControllers[index],
//                     maxLength: 1,
//                     textAlign: TextAlign.center,
//                     keyboardType: TextInputType.number,
//                     onChanged: (value) {
//                       if (value.isNotEmpty && index < _otpControllers.length - 1) {
//                         FocusScope.of(context).nextFocus();
//                       }
//                       setState(() {});
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: areAllOTPsFilled ? () {} : null,
//               style: ElevatedButton.styleFrom(
//                 primary: areAllOTPsFilled ? Colors.blue : Colors.grey,
//               ),
//               child: Text('Verify'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:new_consumer/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

// void main() {
//   runApp(OTPAPP());
// }

void main() {
  runApp(MaterialApp(
    home: TimerApp(),
  ));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: LoginScreen(),
    );
  }
}

class LocationProvider with ChangeNotifier {
  Position? _position;
  bool _isLoading = true;

  Position? get position => _position;
  bool get isLoading => _isLoading;

  Future<void> fetchLocation() async {
    _isLoading = true;
    notifyListeners();

    try {
      _position = await Geolocator.getCurrentPosition();
    } catch (error) {
      print("Error: $error");
      _position = null;
    }

    _isLoading = false;
    notifyListeners();
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Permission'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage(showAddress: false)),
                );
              },
              child: const Text('Continue'),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondPage(showAddress: true)),
                );
              },
              child: const Text('Skip'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final bool showAddress;

  SecondPage({required this.showAddress});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LocationProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Location Details'),
        ),
        body: Center(
          child: Consumer<LocationProvider>(
            builder: (context, locationProvider, _) {
              if (locationProvider.isLoading) {
                return const CircularProgressIndicator();
              } else {
                if (showAddress) {
                  return const Text('Add Address');
                } else {
                  final position = locationProvider.position;
                  if (position != null) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Latitude: ${position.latitude}'),
                        Text('Longitude: ${position.longitude}'),
                      ],
                    );
                  } else {
                    return const Text('Error getting location.');
                  }
                }
              }
            },
          ),
        ),
      ),
    );
  }
}







class LocationApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LocationScreen(),
    );
  }
}

class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late String _locationMessage = "";

  Future<void> _getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _locationMessage = "Location services are disabled.";
      });
      return;
    }

    // Request location permission
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.deniedForever) {
      setState(() {
        _locationMessage = "Location permissions are permanently denied, cannot request again.";
      });
      return;
    }

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        setState(() {
          _locationMessage = "Location permissions are denied.";
        });
        return;
      }
    }

    // Get the current location
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _locationMessage = "Latitude: ${position.latitude}, Longitude: ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(_locationMessage),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _getLocation,
              child: const Text('Get Current Location'),
            ),
          ],
        ),
      ),
    );
  }
}


// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   String mobileNumber = '';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Login'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             TextField(
//               onChanged: (value) {
//                 setState(() {
//                   mobileNumber = value;
//                 });
//               },
//               decoration: const InputDecoration(
//                 hintText: 'Mobile Number',
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 // Show the OTP popup
//                 _showOtpPopup(context);
//               },
//               child: const Text('Send OTP'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   void _showOtpPopup(BuildContext context) {
//     showModalBottomSheet(
//       clipBehavior: Clip.antiAlias,
//       context: context,
//       isScrollControlled: true,
//       builder: (BuildContext context) {
//         return Stack(
//           alignment: Alignment.topRight,
//           children: [
//             const Positioned(
//                 bottom: 150,
//                 child: Icon(Icons.close)),
//             Positioned(
//               bottom: 130,
//                 child: Column(
//               children: [
//                 const Text('Enter OTP'),
//                 const SizedBox(height: 16.0),
//                 const TextField(
//                   decoration: InputDecoration(
//                     hintText: 'OTP',
//                   ),
//                 ),
//                 const SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: () {
//                     // Handle OTP verification
//                     Navigator.pop(context); // Close the bottom sheet
//                   },
//                   child: const Text('Verify OTP'),
//                 ),
//
//               ],
//             )),
//
//           ],
//         );
//       },
//     );
//   }
//
//
// }





class TestMyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Standard Bottom Sheet Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: Color(0xFF6200EE),
        ),
      ),
      home: Scaffold(
        // Use a Builder to get a context within the Scaffold.
        body: Builder(
          builder: (context) {
            return Center(
              child: TextButton(
                child: Text('SHOW BOTTOM SHEET'),
                onPressed: () {
                  showBottomSheet(
                    context: context,
                    builder: (context) {
                      final theme = Theme.of(context);
                      // Using Wrap makes the bottom sheet height the height of the content.
                      // Otherwise, the height will be half the height of the screen.
                      return Wrap(
                        children: [
                          ListTile(
                            title: Text(
                              'Header',
                              style: theme.textTheme.subtitle1
                                  ?.copyWith(color: theme.colorScheme.onPrimary),
                            ),
                            tileColor: theme.colorScheme.primary,
                          ),
                          ListTile(
                            title: Text('Title 1'),
                          ),
                          ListTile(
                            title: Text('Title 2'),
                          ),
                          ListTile(
                            title: Text('Title 3'),
                          ),
                          ListTile(
                            title: Text('Title 4'),
                          ),
                          ListTile(
                            title: Text('Title 5'),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}




class OTPAPP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('OTP Bottom Sheet'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return OtpBottomSheet();
                },
              );
            },
            child: Text('Show OTP Bottom Sheet'),
          ),
        ),
      ),
    );
  }
}








class OtpBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            // height: 200,
            color: Colors.black.withOpacity(0.4), // Semi-transparent background
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the bottom sheet
                  },
                ),
                Text(
                  'Enter OTP',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                TextField(
                  keyboardType: TextInputType.number,
                  maxLength: 6,
                  decoration: InputDecoration(
                    labelText: 'OTP',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    // Handle OTP verification logic here
                  },
                  child: Text('Verify OTP'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





class TimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TimerScreen(),
    );
  }
}

class TimerScreen extends StatefulWidget {
  @override
  _TimerScreenState createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {
  late Timer _timer;
  int _secondsRemaining = 10;
  bool _timerActive = false;

  @override
  void initState() {
    super.initState();
  }

  void startTimer() {
    _timerActive = true;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        stopTimer();
      }
    });
  }

  void stopTimer() {
    _timer.cancel();
    _timerActive = false;
  }

  void restartTimer() {
    _secondsRemaining = 10;
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Timer Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_timerActive)
              Text(
                '$_secondsRemaining',
                style: TextStyle(fontSize: 48),
              ),
            if (!_timerActive)
              ElevatedButton(
                onPressed: startTimer,
                child: Text('Start'),
              ),
            if (_secondsRemaining == 0)
              ElevatedButton(
                onPressed: restartTimer,
                child: Text('Restart'),
              ),
          ],
        ),
      ),
    );
  }
}



