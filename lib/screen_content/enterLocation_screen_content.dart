import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../reusableWidget.dart';
import '../static_data/text_static.dart';

class EnterLocationScreenContent extends StatelessWidget {
  const EnterLocationScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container (
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
            padding: const EdgeInsets.only(left: 24,right: 24,top: 32,bottom: 24),
            decoration:const  ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppText.locationEnterText,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF0D1F37),
                    fontSize: 24,

                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.60,
                  ),
                ),
                    Container(
                      margin: const EdgeInsets.only(top: 24),
                      padding: const EdgeInsets.only(left: 16),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(width: 0.50, color: Color(0xFFDBDBDB)),
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      height: 56,
                      child: TextField(
                        decoration: InputDecoration(
                          suffixIcon: const Icon(Icons.search_outlined,size: 28,),
                          hintText: 'Enter locality or street name',
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.inter(
                            color: const Color(0xFF686868),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.17,
                          )
                        ),
                      ),
                    ),
                    const SizedBox(height: 34,),
                    GestureDetector(
                      onTap: (){
                        // authModel.handleLocationPermission();
                        // Navigator.pushReplacementNamed(context, '/home');
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            const WidgetSpan(child: Icon(Icons.my_location_outlined,color:  Color(0xff2967B0),size: 22,)),
                            const WidgetSpan(child: SizedBox(width: 5,height: 2,)),
                            TextSpan(
                              style: GoogleFonts.inter(
                                color: const Color(0xFF2967B0),
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: -0.17,
                              ),
                              text: ButtonText.locCurrentText
                            )
                          ]
                        )
                      ),
                    ),
                const SizedBox(height: 34,),
                const CustomButton(
                  onPressed: null,
                  title: ButtonText.continueText,
                  color: Color(0xff2967B0),
                ),
                const SizedBox(height: 32,),
                ReusableWidget.footer()
                  ],
                ),
          ),
        ],
      ),

    );
  }
}
