import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_consumer/providers/shield_providers.dart';
import 'package:provider/provider.dart';

import '../../reusableWidget.dart';
import '../../screens/processScreen/select_device.dart';
import '../../static_data/text_static.dart';

class ShieldHomeScreenContent extends StatelessWidget {
  const ShieldHomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final shieldModel = Provider.of<ShieldProviders>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          AppText.shieldAppBar,
          textAlign: TextAlign.center,
          style: TextStyleAll.smallLineStyle,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(builder: (context, constraint) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppText.shieldTitle,
                        style: GoogleFonts.inter(
                          color: const Color(0xFF0D1F37),
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.70,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        AppText.shieldDesc,
                        style: GoogleFonts.inter(
                          color: const Color(0xFF0D1F37),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.44,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      InkWell(
                        onTap: () => shieldModel.moreShield(),
                        child: Text(
                          AppText.shieldLearnMore,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: const Color(0xFF59A4FF),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.17,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: GridView.count(
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 15,
                          crossAxisCount: 3,
                          children: List.generate(
                              ReusableWidget.shieldFeatures.length, (index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(ReusableWidget
                                            .shieldFeatures[index].imagePath),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Expanded(
                                  child: Text(
                                    ReusableWidget.shieldFeatures[index].title,
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.inter(
                                      color: const Color(0xFF0D1F37),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 1.29,
                                      letterSpacing: -0.14,
                                    ),
                                  ),
                                )
                              ],
                            );
                          }),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomCenter,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    showModalBottomSheet(
                                      isDismissible: false,
                                      context: context,
                                      isScrollControlled: true,
                                      builder: (BuildContext context) {
                                        return const SelectDeviceScreen(shield: true,);
                                      },
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 52,
                                    decoration: ShapeDecoration(
                                      color: const Color(0xFF2967B0),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(8)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        ButtonText.shieldBuy,
                                        textAlign: TextAlign.center,
                                        style: GoogleFonts.inter(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: -0.17,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16,),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  height: 52,
                                  decoration: ShapeDecoration(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      side: const BorderSide(
                                        width: 0.50,
                                        strokeAlign: BorderSide.strokeAlignCenter,
                                        color: Color(0xFF2967B0),
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      ButtonText.shieldClaim,
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.inter(
                                        color: const  Color(0xFF2967B0),
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: -0.17,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
