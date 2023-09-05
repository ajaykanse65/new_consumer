import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_consumer/screens/authScreen/email_password_create_screen.dart';
import 'package:new_consumer/static_data/assets_static.dart';
import 'package:new_consumer/static_data/text_static.dart';
import 'package:provider/provider.dart';
import '../../providers/email_password_auth_provider.dart';
import '../../reusableWidget.dart';

class EmailPasswordLoginScreenContent extends StatefulWidget {
  const EmailPasswordLoginScreenContent({super.key});

  @override
  State<EmailPasswordLoginScreenContent> createState() => _EmailPasswordLoginScreenContentState();
}

class _EmailPasswordLoginScreenContentState extends State<EmailPasswordLoginScreenContent> {
  @override
  void initState() {
      final myFormProvider = Provider.of<EmailPasswordAuthProvider>(context, listen: false);
      myFormProvider.passwordVisible = true;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final emailAuthModel = Provider.of<EmailPasswordAuthProvider>(context);
    return  Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const  IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          scrolledUnderElevation : 0,
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          bottom: true,
          child: LayoutBuilder(
            builder: (context, constraint){
              return Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child:  SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: constraint.maxHeight),
                      child: IntrinsicHeight(
                        child: Form(
                          autovalidateMode: AutovalidateMode.disabled,
                          key: emailAuthModel.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                AppText.loginWithAccount,
                                style: GoogleFonts.inter(
                                  color: const Color(0xFF0D1F37),
                                  fontSize: 28,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: -0.70,
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                      text: AppText.noAccount,
                                      style: GoogleFonts.inter(
                                        color: const Color(0xFF0D1F37),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.17,
                                      ),
                                    ),
                                    WidgetSpan(
                                      child: GestureDetector(
                                        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const EmailPasswordCreateScreen())),
                                        child: Text(AppText.createAcc,
                                            style: GoogleFonts.inter(
                                                color: const Color(0xFF59A4FF),
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: -0.17,
                                                height: 0)),
                                      ),
                                    ),
                                  ],
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 40,),
                              TextFormField(

                              //   onChanged: (val){
                              //     emailAuthModel.formKey.currentState?.validate();
                              //   },
                              validator: (value){
                                  if(value!.isEmpty){
                                    return "Please Enter Email";
                                  }else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
                                    return "Please Enter a Valid Email";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.emailAddress,
                                controller: emailAuthModel.userEmail,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 15),
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0.50,
                                        strokeAlign: BorderSide.strokeAlignCenter,
                                        color: emailAuthModel.emailValidate
                                            ? const Color(0xFFDE2C2C)
                                            : const Color(0xFFDBDBDB),
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        width: 0.50,
                                        strokeAlign: BorderSide.strokeAlignCenter,
                                        color: Color(0xFFDE2C2C),
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        width: 0.50,
                                        strokeAlign: BorderSide.strokeAlignCenter,
                                        color: Color(0xFFDE2C2C),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0.50,
                                        strokeAlign: BorderSide.strokeAlignCenter,
                                        color: emailAuthModel.emailValidate
                                            ? const Color(0xFFDE2C2C)
                                            : const Color(0xFFDBDBDB),
                                      ),
                                    ),
                                    errorStyle: GoogleFonts.inter(
                                      color: const Color(0xFFDE2C2C),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 1.43,
                                    ),
                                    hintText: 'Email Address',
                                    helperStyle: GoogleFonts.inter(
                                      color: const Color(0xFF686868),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.17,
                                    ),
                                    border: InputBorder.none),
                              ),
                              const SizedBox(height: 16,),
                              TextFormField(
                                // onChanged: (pass){
                                //   emailAuthModel.formKey.currentState?.validate();
                                // },
                                validator: (pass){
                                  if(pass!.isEmpty){
                                    return "Please Enter Password";
                                  }else if(pass.length < 6){
                                    return "Password should be 6 Character";
                                  }
                                  return null;
                                },
                                controller: emailAuthModel.userPassword,
                                textInputAction: TextInputAction.done,
                                obscureText: emailAuthModel.passwordVisible,
                                keyboardType: TextInputType.visiblePassword,
                                // controller: authModel.mobileNo,
                                decoration: InputDecoration(
                                    alignLabelWithHint: false,
                                    filled: true,
                                    suffixIcon: IconButton(
                                      onPressed: () => emailAuthModel.passwordVisibility(),
                                      icon: Icon(emailAuthModel.passwordVisible
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined),
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 15),
                                    fillColor: Colors.white,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0.50,
                                        strokeAlign: BorderSide.strokeAlignCenter,
                                        color: emailAuthModel.passwordValidate
                                            ? const Color(0xFFDE2C2C)
                                            : const Color(0xFFDBDBDB),
                                      ),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        width: 0.50,
                                        strokeAlign: BorderSide.strokeAlignCenter,
                                        color: Color(0xFFDE2C2C),
                                      ),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: const BorderSide(
                                        width: 0.50,
                                        strokeAlign: BorderSide.strokeAlignCenter,
                                        color: Color(0xFFDE2C2C),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        width: 0.50,
                                        strokeAlign: BorderSide.strokeAlignCenter,
                                        color: emailAuthModel.passwordValidate
                                            ? const Color(0xFFDE2C2C)
                                            : const Color(0xFFDBDBDB),
                                      ),
                                    ),
                                    errorStyle: GoogleFonts.inter(
                                      color: const Color(0xFFDE2C2C),
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      height: 1.43,
                                    ),
                                    hintText: 'Password',
                                    helperStyle: GoogleFonts.inter(
                                      color: const Color(0xFF686868),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.17,
                                    ),
                                    border: InputBorder.none),
                              ),
                              const SizedBox(height: 24,),
                               CustomButton(
                                onPressed: () => emailAuthModel.userLogin(context),
                                title: ButtonText.continueText,
                                color: const Color(0xff2967B0),
                              ),
                              const SizedBox(
                                height: 32,
                              ),
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
                                onTap: () => Navigator.pop(context),
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
                                      hintText: 'Continue with Mobile Number',
                                      prefixIcon: Align(
                                          widthFactor: 1.0,
                                          heightFactor: 1.0,
                                          child: SvgPicture.asset(ImagePath.mobileLogo,)),
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
                              const Spacer(),
                              // ReusableWidget.footer()
                              Expanded(
                                child: Align(
                                  alignment: FractionalOffset.bottomCenter,
                                  child: ReusableWidget.footer(),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                );
            },
          ),
        ),
      );
  }
}
