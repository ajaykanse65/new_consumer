import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_consumer/providers/auth_provider.dart';
import 'package:new_consumer/reusableWidget.dart';
import 'package:new_consumer/screens/authScreen/email_password_login_screen.dart';
import 'package:new_consumer/static_data/text_static.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_consumer/static_data/assets_static.dart';
import 'package:provider/provider.dart';

class LoginScreenContent extends StatelessWidget {
  const LoginScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final authModel = Provider.of<AuthProvider>(context);
    return GestureDetector(
      onTap: () => authModel.setVisible(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child:  Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 26),
                  child: SvgPicture.asset(ImagePath.wanLogo),
                ),
                Container(
                  padding:
                  const EdgeInsets.only(left: 24, right: 24, ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: AppText.expertText,
                              style: TextStyleAll.lineStyle,
                            ),
                            TextSpan(
                              text: AppText.zippyExpertText,
                              style: TextStyleAll.headLineStyle,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        AppText.descText,
                        style: TextStyleAll.mediumStyle,
                      ),
                      const SizedBox(height: 32,),
                      // if (Platform.isAndroid)
                      // TextFormField(
                      //   onTap:()=> authModel.setHidden(),
                      //   controller: authModel.mobileNo,
                      //   inputFormatters: [
                      //     LengthLimitingTextInputFormatter(10)
                      //   ],
                      //   keyboardType: TextInputType.phone,
                      //   decoration: InputDecoration(
                      //       contentPadding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                      //       fillColor: Colors.white,
                      //       errorBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(8),
                      //         borderSide: const BorderSide(
                      //           width: 0.50,
                      //           strokeAlign: BorderSide.strokeAlignCenter,
                      //           color:  Color(0xFFDE2C2C),                                ),
                      //       ),
                      //       focusedErrorBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(8),
                      //         borderSide: const BorderSide(
                      //           width: 0.50,
                      //           strokeAlign: BorderSide.strokeAlignCenter,
                      //           color:  Color(0xFFDE2C2C),                                ),
                      //       ),
                      //       enabledBorder: OutlineInputBorder(
                      //         borderRadius: BorderRadius.circular(8),
                      //         borderSide:  BorderSide(
                      //           width: 0.50,
                      //           strokeAlign: BorderSide.strokeAlignCenter,
                      //           color: authModel.isValidate ?const Color(0xFFDE2C2C) :const Color(0xFFDBDBDB),
                      //         ),
                      //       ),
                      //       errorStyle: GoogleFonts.inter(
                      //         color:const Color(0xFFDE2C2C),
                      //         fontSize: 14,
                      //         fontWeight: FontWeight.w500,
                      //         height: 1.43,
                      //       ),
                      //       errorText: authModel.isValidate ? 'Enter 10 digits mobile number' : null,
                      //       hintText: 'Mobile Number',
                      //       helperStyle: GoogleFonts.inter(
                      //         color: const Color(0xFF686868),
                      //         fontSize: 16,
                      //         fontWeight: FontWeight.w500,
                      //         letterSpacing: -0.17,
                      //       ),
                      //       border: InputBorder.none),
                      // ),
                      // if (Platform.isIOS)
                        Form(
                          key: authModel.formKey,
                          child: TextFormField(
                            validator: (value){
                              if(value!.isEmpty){
                                return "Please Enter Mobile Number";
                              }else if(value.length < 10){
                                return "Please Enter a Valid Mobile Number";
                              }
                              return null;
                            },
                            onTap:()=> authModel.setHidden(),
                            controller: authModel.mobileNo,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                              FilteringTextInputFormatter.allow(
                                RegExp(r"[0-9]"),
                              )
                            ],
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 15),
                                fillColor: Colors.white,
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    width: 0.50,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color:  Color(0xFFDE2C2C),                                ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:  BorderSide(
                                    width: 0.50,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: authModel.isValidate ?const Color(0xFFDE2C2C) :const Color(0xFFDBDBDB),
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    width: 0.50,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color:  Color(0xFFDE2C2C),                                ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide:  BorderSide(
                                    width: 0.50,
                                    strokeAlign: BorderSide.strokeAlignCenter,
                                    color: authModel.isValidate ?const Color(0xFFDE2C2C) :const Color(0xFFDBDBDB),
                                  ),
                                ),
                                errorStyle: GoogleFonts.inter(
                                  color:const Color(0xFFDE2C2C),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  height: 1.43,
                                ),
                                hintText: 'Mobile Number',
                                helperStyle: GoogleFonts.inter(
                                  color: const Color(0xFF686868),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.17,
                                ),
                                border: InputBorder.none),
                          ),
                        ),
                      const SizedBox(height: 24,),
                      CustomButton(
                        onPressed: () async {
                          await authModel.sendOTP(context);
                        },
                        title: ButtonText.otpText,
                        color: const Color(0xff2967B0),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Visibility(
                        visible: authModel.isHidden,
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                "- OR -",
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF686868),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  height: 1.44,
                                ),
                              ),
                            ),
                            const SizedBox(height: 24,),
                            GestureDetector(
                              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const EmailPasswordLoginScreen())),
                              child: TextField(
                                  enabled: false,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 15),
                                      disabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        width: 0.50,
                                        strokeAlign: BorderSide.strokeAlignCenter,
                                        color: Color(0xFFDBDBDB),
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                      hintStyle: GoogleFonts.inter(
                                        color: const Color(0xFF0F172A),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        height: 1.50,
                                      ),
                                      hintText: 'Continue with Email',
                                      prefixIcon: Align(
                                          widthFactor: 1.0,
                                          heightFactor: 1.0,
                                          child: SvgPicture.asset(ImagePath.emailLogo,)),
                                      border: InputBorder.none
                                  ),
                                ),

                            ),
                            const SizedBox(height: 12,),
                            GestureDetector(
                              onTap: null,
                              child: TextField(
                                  enabled: false,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 15),
                                      disabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 0.50,
                                          strokeAlign: BorderSide.strokeAlignCenter,
                                          color: Color(0xFFDBDBDB),
                                        ),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      hintStyle: GoogleFonts.inter(
                                        color: const Color(0xFF0F172A),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        height: 1.50,
                                      ),
                                      hintText: 'Continue with Google',
                                      prefixIcon: Align(
                                          widthFactor: 1.0,
                                          heightFactor: 1.0,
                                          child: SvgPicture.asset(ImagePath.googleLogo)),
                                      border: InputBorder.none
                                  ),
                                ),

                            ),
                            const SizedBox(height: 32,),
                          ],
                        ),),

                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ReusableWidget.footer(),
                )

              ],
            ),

        ),
      ),
    );
  }
}
