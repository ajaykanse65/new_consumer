

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_consumer/providers/auth_provider.dart';
import 'package:new_consumer/reusableWidget.dart';
import 'package:new_consumer/static_data/text_static.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_consumer/static_data/assets_static.dart';
import 'package:provider/provider.dart';

class LoginScreenContent extends StatelessWidget {
  const LoginScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    final authModel = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Visibility(
              visible: authModel.isHidden,
              child: SvgPicture.asset(ImagePath.wanLogo),
            ),
            Container(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 32),
              child: Column(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: AppText.zippyExpertText,
                          style: TextStyleAll.headLineStyle,
                        ),
                        TextSpan(
                          text: AppText.expertText,
                          style: TextStyleAll.lineStyle,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12,),
                  Text(
                    AppText.descText,
                    style: TextStyleAll.mediumStyle,
                  ),
                  if(Platform.isAndroid)
                    Container(
                    margin: const EdgeInsets.only(top: 32),
                    padding: const EdgeInsets.only(left: 16),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 0.50,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFDBDBDB),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: TextFormField(
                      focusNode: authModel.focusNode,
                      controller: authModel.mobileNo,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(12)
                      ],
                      keyboardType: TextInputType.phone,
                      onTap:()=> authModel.setHidden(),
                      decoration: InputDecoration(
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
                  if(Platform.isIOS)
                    Container(
                      margin: const EdgeInsets.only(top: 32),
                      padding: const EdgeInsets.only(left: 16),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                            width: 0.50,
                            strokeAlign: BorderSide.strokeAlignCenter,
                            color: Color(0xFFDBDBDB),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: TextFormField(
                        controller: authModel.mobileNo,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(10)
                        ],
                        keyboardType: TextInputType.phone,
                        onTap:()=> authModel.setHidden(),
                        decoration: InputDecoration(
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
                ],
              ),
            ),
            CustomButton(

                onPressed: () async{
                  await authModel.sendOTP(context);
                }, title: ButtonText.continueText, color: const Color(0xff2967B0),
            ),
            const SizedBox(
              height: 32,
            ),
            ReusableWidget.footer()
          ],
        ),
      ),
    );
  }
}
