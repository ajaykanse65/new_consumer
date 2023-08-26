import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_consumer/reusableWidget.dart';
import 'package:new_consumer/screens/enterLocation_screen.dart';
import 'package:new_consumer/static_data/text_static.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';

class SelectLocationScreenContent extends StatefulWidget {
  const SelectLocationScreenContent({super.key});

  @override
  State<SelectLocationScreenContent> createState() =>
      _SelectLocationScreenContentState();
}

class _SelectLocationScreenContentState
    extends State<SelectLocationScreenContent> {

  @override
  Widget build(BuildContext context) {
    final authModel = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          AppText.locationText,
          style: TextStyleAll.smallLineStyle,
          textAlign: TextAlign.center,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 23),
                child: Text(
                  AppText.locationHelpText,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF0D1F37),
                    fontSize: 28,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.17,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23),
                child: Text(
                  AppText.locationHelpDescText,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF686868),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 1.44,
                  ),
                ),
              ),
              GestureDetector(
                onTap: ()async{
                  // authModel.handleLocationPermission();
                  authModel.getPermission();
                  authModel.setLocation();
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: Container(
                  height: 52,
                  margin: const EdgeInsets.only(left: 24, right: 24, top: 40),
                  decoration: ShapeDecoration(
                    color: const Color(0xff2967B0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Center(
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const WidgetSpan(child: Icon(Icons.my_location_outlined,color: Colors.white,size: 22,)),
                          const WidgetSpan(child: SizedBox(width: 5,height: 2,)),
                          TextSpan(
                            text: ButtonText.locAccessText,
                            style: GoogleFonts.inter(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              letterSpacing: -0.17,
                              height: 1.50,
                            )
                          )
                        ]
                      )
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){

                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (BuildContext context) {
                      return const EnterLocationScreen();
                    },
                  );
                },
                child: Container(
                  height: 52,
                  margin: const EdgeInsets.only(left: 24, right: 24, top: 16),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xff2967B0)),
                    borderRadius: BorderRadius.circular(8)
                  ),
                  child: Center(
                    child: Text.rich(
                        TextSpan(
                            children: [
                              const WidgetSpan(child: Icon(Icons.search_sharp,color:  Color(0xff2967B0),size: 22,)),
                              const WidgetSpan(child: SizedBox(width: 5,height: 2,)),
                              TextSpan(
                                  text: ButtonText.locManualText,
                                  style: GoogleFonts.inter(
                                    color: const Color(0xff2967B0),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: -0.17,
                                    height: 1.50,
                                  )
                              )
                            ]
                        )
                    ),
                  ),
                ),
              ),
              Center(
                 child: TextButton(onPressed: (){
                   authModel.skipMethod();
                   authModel.unSetLocation();
                   Navigator.pushReplacementNamed(context, '/home');
                 }, child: Text(
                   ButtonText.locSkipText,
                   textAlign: TextAlign.center,
                   style: GoogleFonts.inter(
                   color: const Color(0xFF0D1F37),
                   fontSize: 16,
                   fontWeight: FontWeight.w600,
                   letterSpacing: -0.17,
              ),)),
               ),
              const Spacer(),
              Center(child: ReusableWidget.footer())
            ],
          ),
      ),

    );
  }
}
