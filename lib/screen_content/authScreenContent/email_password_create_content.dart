import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../providers/email_password_auth_provider.dart';
import '../../reusableWidget.dart';
import '../../static_data/text_static.dart';


class EmailPasswordCreateScreenContent extends StatefulWidget {
  const EmailPasswordCreateScreenContent({super.key});

  @override
  State<EmailPasswordCreateScreenContent> createState() => _EmailPasswordCreateScreenContentState();
}

class _EmailPasswordCreateScreenContentState extends State<EmailPasswordCreateScreenContent> {
  @override
  void initState() {
    final myFormProvider = Provider.of<EmailPasswordAuthProvider>(context, listen: false);
    myFormProvider.passwordVisible = true;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final emailAuthModel = Provider.of<EmailPasswordAuthProvider>(context);
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: const  IconThemeData(
            color: Colors.black, //change your color here
          ),
          elevation: 0,
          scrolledUnderElevation : 0,
          backgroundColor: Colors.transparent,
        ),
        body:  SafeArea(
          bottom: true,
          child: LayoutBuilder(
            builder: (context, constraint){
              return Padding(
                padding: const EdgeInsets.only(left: 24, right: 24),
                child: SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minHeight: constraint.maxHeight),
                    child: IntrinsicHeight(
                      child: Form(
                        key: emailAuthModel.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppText.create,
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
                                    text: AppText.exitAccount,
                                    style: GoogleFonts.inter(
                                      color: const Color(0xFF0D1F37),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: -0.17,
                                    ),
                                  ),
                                  WidgetSpan(
                                    child: GestureDetector(
                                      onTap: () => Navigator.pop(context),
                                      child: Text(AppText.login,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    validator: (first){
                                      if(first!.isEmpty){
                                        return "*Required";
                                      }
                                      return null;
                                    },
                                    controller: emailAuthModel.firstName,
                                    // controller: authModel.mobileNo,
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            width: 0.50,
                                            strokeAlign: BorderSide.strokeAlignCenter,
                                            color: emailAuthModel.fNameValidate
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
                                            color: emailAuthModel.fNameValidate
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
                                        hintText: 'First Name',
                                        helperStyle: GoogleFonts.inter(
                                          color: const Color(0xFF686868),
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          letterSpacing: -0.17,
                                        ),
                                        border: InputBorder.none),
                                  ),
                                ),
                                const SizedBox(width: 16,),
                                Expanded(
                                  child: TextFormField(
                                    validator: (last){
                                      if(last!.isEmpty){
                                        return "*Required";
                                      }
                                      return null;
                                    },
                                    controller: emailAuthModel.lastName,
                                    // controller: authModel.mobileNo,
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
                                        fillColor: Colors.white,
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(8),
                                          borderSide: BorderSide(
                                            width: 0.50,
                                            strokeAlign: BorderSide.strokeAlignCenter,
                                            color: emailAuthModel.lNameValidate
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
                                            color: emailAuthModel.lNameValidate
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
                                        hintText: 'Last Name',
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
                            const SizedBox(height: 16,),
                            TextFormField(
                              validator: (value){
                                if(value!.isEmpty){
                                  return "Please Enter Email";
                                }else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value)){
                                  return "Please Enter a Valid Email";
                                }
                                return null;
                              },
                              controller: emailAuthModel.userEmail,
                              // controller: authModel.mobileNo,
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
                              validator: (pass){
                                if(pass!.isEmpty){
                                  return "Please Enter Password";
                                }else if(pass.length < 6){
                                  return "Please should be 6 Character";
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
                              onPressed: () => emailAuthModel.userCreate(context),
                              title: ButtonText.continueText,
                              color:const Color(0xff2967B0),
                            ),
                            const Spacer(),
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
