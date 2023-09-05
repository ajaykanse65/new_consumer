
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_consumer/dataModel/repair_feature.dart';
import 'package:new_consumer/providers/shield_providers.dart';
import 'package:new_consumer/static_data/assets_static.dart';
import 'package:new_consumer/static_data/text_static.dart';
import 'package:provider/provider.dart';

class ReusableWidget{

  static const List<Feature> repairFeatures = <Feature>[
    Feature(title: AppText.featureOne, imagePath: RepairImages.featureOne),
    Feature(title: AppText.featureTwo, imagePath: RepairImages.featureTwo),
    Feature(title: AppText.featureThree, imagePath: RepairImages.featureThree),
    Feature(title: AppText.featureFour, imagePath: RepairImages.featureFour),
    Feature(title: AppText.featureFive, imagePath: RepairImages.featureFive),
    Feature(title: AppText.featureSix, imagePath: RepairImages.featureSix),
    Feature(title: AppText.featureSeven, imagePath: RepairImages.featureSeven),
  ];
  static const List<Feature> shieldFeatures = <Feature>[
    Feature(title: AppText.featureSeven, imagePath: RepairImages.featureSeven),
    Feature(title: AppText.shieldTwo, imagePath: RepairImages.shieldTwo),
    Feature(title: AppText.shieldThree, imagePath: RepairImages.featureThree),
    Feature(title: AppText.shieldFour, imagePath: RepairImages.featureFour),
    Feature(title: AppText.featureFive, imagePath: RepairImages.featureFive),
    Feature(title: AppText.featureSix, imagePath: RepairImages.featureSix),
  ];





  static Widget footer(){
    return  Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: 327,
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: AppText.terms1Text,
                style: GoogleFonts.inter(
                  color: const Color(0xFF686868),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
              TextSpan(
                text: AppText.terms2Text,
                style: GoogleFonts.inter(
                  color: const Color(0xFF686868),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  height: 1.50,
                ),
              ),
              TextSpan(
                text: AppText.terms3Text,
                style: GoogleFonts.inter(
                  color: const Color(0xFF686868),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.50,
                ),
              ),
              TextSpan(
                text: AppText.terms4Text,
                style: GoogleFonts.inter(
                  color: const Color(0xFF686868),
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  decoration: TextDecoration.underline,
                  height: 1.50,
                ),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }


  static Widget serviceDetails(BuildContext context){
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
                Row(
                  children: [
                    SvgPicture.asset(ImagePath.warrantyDetails),
                    const SizedBox(width: 12,),
                    Text(
                      'Extended Warrenty',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF0D1F37),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        height: 1,
                        letterSpacing: -0.18,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15,),
                Text(
                  '(Device purchased within 6 months) issue and if the device requires additional or different service, then the cost may differ.',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF4D4D4D),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.44,
                  ),
                ),
                const SizedBox(height: 24,),
                const Divider(thickness: 1.5,),
                const SizedBox(height: 24,),
                Row(
                  children: [
                    SvgPicture.asset(ImagePath.careDetails),
                    const SizedBox(width: 12,),
                    Text(
                      'Care+',
                      style: GoogleFonts.inter(
                        color: const Color(0xFF0D1F37),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        height: 1,
                        letterSpacing: -0.18,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 15,),
                Text(
                  '(Screen protection, Accidental & Liquid Damage) Adding genuine issue will help you and us find the real solution, save time and cost.',
                  style: GoogleFonts.inter(
                    color: const Color(0xFF4D4D4D),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 1.44,
                  ),
                ),
                // Text.rich(TextSpan(
                //   children: [
                //     WidgetSpan(child: Row(
                //       children: [
                //         SvgPicture.asset(ImagePath.warrantyDetails),
                //         const SizedBox(width: 12,),
                //         Text(
                //           'Extended Warrenty',
                //           style: GoogleFonts.inter(
                //             color: const Color(0xFF0D1F37),
                //             fontSize: 18,
                //             fontWeight: FontWeight.w600,
                //             height: 1,
                //             letterSpacing: -0.18,
                //           ),
                //         )
                //       ],
                //     )),
                //
                //
                //   ]
                // )),
                const SizedBox(height: 30,),

              ],
            ),
          ),
        ],
      ),
    );
  }



  static Widget selectService(BuildContext context){
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Select Service type',
                        style: GoogleFonts.inter(
                          color: const Color(0xFF0D1F37),
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.17,
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        showModalBottomSheet(
                          isDismissible: false,
                          context: context,
                          isScrollControlled: true,
                          builder: (BuildContext context) {
                            return ReusableWidget.serviceDetails(context);
                          },
                        );
                      },
                      child: Text(
                        'View Details',
                        textAlign: TextAlign.right,
                        style: GoogleFonts.inter(
                          color: const Color(0xFF59A4FF),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          letterSpacing: -0.17,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 24,),
                Row(
                  children: [

                    Expanded(
                      child: Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundColor: Color(0xff2C6AAC),
                                radius: 40,
                                backgroundImage: AssetImage(ImagePath.shieldWarranty),
                                ),
                            const SizedBox(height: 40,),
                            Text(
                              'Extended Warrenty',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                color: const Color(0xFF0D1F37),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1.12,
                                letterSpacing: -0.16,
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Text(
                              '(Device purchased within 6 months)',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                color: const Color(0xFF686868),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.29,
                                letterSpacing: -0.14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Column(
                          children: [
                            Image.asset(RepairImages.featureFour,height: 82,width: 82,),
                            const SizedBox(height: 40,),
                            Text(
                              'Care+',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                color: const Color(0xFF0D1F37),
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                height: 1.12,
                                letterSpacing: -0.16,
                              ),
                            ),
                            const SizedBox(height: 8,),
                            Text(
                              '(Screen protection, Accidental & Liquid Damage)',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                color: const Color(0xFF686868),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                height: 1.29,
                                letterSpacing: -0.14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40,),

              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget listView(){
    return Expanded(
      child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
                     itemBuilder: (BuildContext context,int index){
                       return const Text('data');
                     }),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final VoidCallback? onPressed;
  const CustomButton({super.key, required this.title, required this.onPressed, required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 52,
        // margin: const EdgeInsets.only(left: 24, right: 24, top: 40),
        decoration: ShapeDecoration(
          color: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)),
        ),
        child: Center(
          child: Text(title,
          style: GoogleFonts.inter(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            letterSpacing: -0.17,
          ),),
        ),
      ),
    );
  }
}




class DismissKeyboard extends StatelessWidget {
  final Widget child;
  const DismissKeyboard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      child: child,
    );
  }
}