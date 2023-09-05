import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_consumer/providers/repair_providers.dart';
import 'package:new_consumer/reusableWidget.dart';
import 'package:new_consumer/screens/processScreen/select_device.dart';
import 'package:new_consumer/static_data/text_static.dart';
import 'package:provider/provider.dart';

class RepairHomeScreenContent extends StatelessWidget {
  const RepairHomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final repairModel = Provider.of<RepairProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const  IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(AppText.repairAppBar,
          textAlign: TextAlign.center,
          style: TextStyleAll.smallLineStyle,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
      body: SafeArea(
        bottom: false,
        child: LayoutBuilder(builder: (context, constraint){
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraint.maxHeight),
              child: IntrinsicHeight(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24,right: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppText.repairTitle,
                        style: GoogleFonts.inter(
                          color: const Color(0xFF0D1F37),
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.70,
                        ),
                      ),
                      const SizedBox(height: 12,),
                      InkWell(
                        onTap: () => repairModel.moreRepair(),
                        child: Text(
                          AppText.repairLearnMore,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.inter(
                            color: const Color(0xFF59A4FF),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.17,
                          ),
                        ),
                      ),
                      const SizedBox(height: 40,),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.6,
                        child: GridView.count(
                          mainAxisSpacing: 10,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 15,
                          crossAxisCount: 3,
                          children: List.generate(ReusableWidget.repairFeatures.length, (index) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Container(
                                    width: 80,
                                    height: 80,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(ReusableWidget.repairFeatures[index].imagePath),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 12,),
                                Expanded(
                                  child: Text(ReusableWidget.repairFeatures[index].title,
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
                          child: CustomButton(title: ButtonText.repairHome, onPressed: (){
                            showModalBottomSheet(
                              isDismissible: false,
                              context: context,
                              isScrollControlled: true,
                              builder: (BuildContext context) {
                                return const SelectDeviceScreen(shield: false,);
                              },
                            );
                          }, color: Color(0xff2967B0)),
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
