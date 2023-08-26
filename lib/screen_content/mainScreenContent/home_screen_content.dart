import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';


class HomeScreenContent extends StatefulWidget {
  const HomeScreenContent({super.key});

  @override
  State<HomeScreenContent> createState() => _HomeScreenContentState();
}

class _HomeScreenContentState extends State<HomeScreenContent> {
  @override
  void initState() {
    final myFormProvider = Provider.of<AuthProvider>(context, listen: false);
    myFormProvider.checkNavigation();
    super.initState();
  }

  // Future<void> checkLocation() async {
  //   final myFormProvider = Provider.of<AuthProvider>(context, listen: false);
  //   final hasPermission = await myFormProvider.handleLocationPermission();
  //   if(hasPermission == true){
  //     myFormProvider.getCurrentPosition();
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    final authModel = Provider.of<AuthProvider>(context);
    print(authModel.isNavigate);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => print('Change Location'),
              child: Text.rich(TextSpan(children: [
                const WidgetSpan(
                    child: Icon(
                      Icons.location_on,
                      color: Colors.lightBlue,
                      size: 23,
                    )),
                TextSpan(
                    text: "Mathew",
                    style: GoogleFonts.inter(
                      color: const Color(0xFF0D1F37),
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: -0.17,
                    )),
                const WidgetSpan(
                    child: Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                      size: 21,
                    ))
              ])),
            ),
            Text( authModel.address,
              style: GoogleFonts.inter(
                color: const Color(0xFF58595B),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 24),
            width: 40,
            height: 40,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xff353535),
                      Color(0xff6A6A6A),
                    ])),
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
        bottomOpacity: 0,
        backgroundColor: Colors.white,
      ),
      body:  const Column(
        children: [],
      ),
    );
  }
}
