import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_consumer/reusableWidget.dart';
import '../../static_data/assets_static.dart';

class SelectDeviceScreenContent extends StatelessWidget {
  final bool isShield;
  const SelectDeviceScreenContent({super.key, required this.isShield});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.zero,
              color: Colors.transparent,
            ),
            height: 40,
            width: MediaQuery.of(context).size.width,
            child:  Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 42,
                  width: 42,
                  margin: const EdgeInsets.only(right: 24),
                  decoration: const ShapeDecoration(
                    color: Color(0xFFF4F4F4),
                    shape: OvalBorder(),
                  ),
                  child:  IconButton(
                      icon: SvgPicture.asset(ImagePath.backButton,),onPressed: () => Navigator.pop(context)),
                ),
                Container(
                  height: 39,
                  width: 39,
                  margin: const EdgeInsets.only(right: 24),
                  decoration: const ShapeDecoration(
                    color: Color(0xFFF4F4F4),
                    shape: OvalBorder(),
                  ),
                  child:  IconButton(
                      icon: Icon(Icons.clear,color: Colors.grey.shade800,weight: 5.0,),onPressed: () => Navigator.pop(context)),
                ),

              ],
            ),
          ),
          const SizedBox(height: 16,),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration:const  ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
            padding: const EdgeInsets.only(left: 24,right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 32,),
                Text(
                  'Select your Device',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF0D1F37),
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    height: 1.43,
                    letterSpacing: -0.17,
                  ),
                ),
                const SizedBox(height: 32,),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.23,
                    child :ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        GestureDetector(
                          onTap: (){
                            if(isShield == true){
                              showModalBottomSheet(
                                isDismissible: false,
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return ReusableWidget.selectService(context);
                                },
                              );
                            }else{
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 110,
                                width: 110,
                                padding: const EdgeInsets.only(
                                    right: 8, left: 8),
                                margin: const EdgeInsets.only(
                                    right: 12, bottom: 8),
                                child: Image.asset(ImagePath.deviceMobile),
                              ),
                              Text(
                                'Mobile',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF0D1F37),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 1.12,
                                  letterSpacing: -0.16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            if(isShield == true){
                              showModalBottomSheet(
                                isDismissible: false,
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return ReusableWidget.selectService(context);
                                },
                              );
                            }else{
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 110,
                                width: 110,
                                padding: const EdgeInsets.only(right: 8),
                                margin: const EdgeInsets.only(
                                    right: 12, bottom: 8),
                                child: Image.asset(ImagePath.homeLaptop),
                              ),
                              Text(
                                'Laptop',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF0D1F37),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 1.12,
                                  letterSpacing: -0.16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            if(isShield == true){
                              showModalBottomSheet(
                                isDismissible: false,
                                context: context,
                                isScrollControlled: true,
                                builder: (BuildContext context) {
                                  return ReusableWidget.selectService(context);
                                },
                              );
                            }else{
                            }
                          },
                          child: Column(
                            children: [
                              Container(
                                height: 110,
                                width: 110,
                                padding: const EdgeInsets.only(
                                    right: 8, left: 8),
                                margin: const EdgeInsets.only(
                                    right: 12, bottom: 8),
                                child: Image.asset(ImagePath.deviceTablet),
                                // child: SvgPicture.asset(ImagePath.homeTablet),
                              ),
                              Text(
                                'Tablet',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF0D1F37),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  height: 1.12,
                                  letterSpacing: -0.16,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )
                ),
                const SizedBox(height: 20,),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
