import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_consumer/reusableWidget.dart';
import 'package:new_consumer/screens/authScreen/login_screen.dart';
import 'package:new_consumer/screens/mainScreen/home_screen.dart';
import 'package:new_consumer/screens/repairScreen/repairHome_screen.dart';
import 'package:new_consumer/screens/shieldScreen/shieldHome_screen.dart';
import 'package:new_consumer/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        bottomSheetTheme:
            const BottomSheetThemeData(backgroundColor: Colors.transparent),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>  SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/repair' : (context) => const RepairHomeScreen(),
        '/shield' : (context) => const ShieldHomeScreen(),
      },
    ));
  }
}
