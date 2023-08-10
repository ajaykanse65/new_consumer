import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_consumer/providers/auth_provider.dart';
import 'package:new_consumer/reusableWidget.dart';
import 'package:new_consumer/static_data/text_static.dart';
import 'package:provider/provider.dart';

class OtpScreenContent extends StatefulWidget {
  final String mobileNumber;
  const OtpScreenContent({super.key, required this.mobileNumber});

  @override
  State<OtpScreenContent> createState() => _OtpScreenContentState();
}

class _OtpScreenContentState extends State<OtpScreenContent> {


  @override
  void initState() {
    final myFormProvider = Provider.of<AuthProvider>(context, listen: false);
    myFormProvider.startTimer();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final authModel = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  AppText.verificationText,
                  style: GoogleFonts.inter(
                    color: const Color(0xFF0D1F37),
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    height: 1.43,
                    letterSpacing: -0.17,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24,right: 24,top: 12),
                child: Text.rich(
                  TextSpan(
                    children: [
                      const TextSpan(
                        text: AppText.noText,
                        style: TextStyle(
                          color: Color(0xFF686868),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          // height: 1.81,
                        ),
                      ),
                      TextSpan(
                        text: '+91 ${widget.mobileNumber}',
                        style: const TextStyle(
                          color: Color(0xFF0D1F37),
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w500,
                          // height: 1.61,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24,right: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(4, (index) => Container(
                    width: 60,
                    height: 60,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 0.50,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFFDBDBDB),
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: TextField(
                      controller: authModel.otpControllers[index],
                      autofocus: true,
                      onChanged: (value) {
                        if (value.isNotEmpty && index < authModel.otpControllers.length - 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(1)
                      ],
                      style: GoogleFonts.inter(
                        color: const Color(0xFF0D1F37),
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        height: 1.32,
                        letterSpacing: -0.17,
                      ),
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(border: InputBorder.none),
                    ),
                  )),
                ),
              ),
              const SizedBox(
                height: 36,
              ),
              Center(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: AppText.resendText,
                        style: GoogleFonts.inter(
                          color: const Color(0xFF4D4D4D),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.75,
                          letterSpacing: -0.17,
                        ),
                      ),
                      TextSpan(
                        text:
                            authModel.secondsRemaining.toString().padLeft(2, '0'),
                        style: GoogleFonts.inter(
                          color: const Color(0xFF2DC215),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          height: 1.75,
                          letterSpacing: -0.17,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: CustomButton(
                    title: ButtonText.verifyText,
                    onPressed:authModel.areAllOTPsFilled ? () {
                      print('object');
                    } : null,
                    color: authModel.areAllOTPsFilled ? const Color(0xff2967B0) : const Color(0xffCACACA),
                  )),
              const SizedBox(height: 20,),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: ReusableWidget.footer())
            ],
          ),
      ),

    );
  }
}
