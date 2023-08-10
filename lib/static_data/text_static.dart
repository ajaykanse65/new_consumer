import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText {
  static const String zippyExpertText = "Zippy Experts";
  static const String expertText = " armed with the latest tools and techniques";
  static const String descText = "Time to step into a world of hassle-free gadget maintenance!";
  static const String terms1Text = "By selecting you are agreeing to the ";
  static const String terms2Text = "Terms of Services";
  static const String terms3Text = " & ";
  static const String terms4Text = "Privacy Policy";
  static const String tagText = "Fast.\nReliable.\nModern.";
  static const String verificationText = "Enter verification code";
  static const String noText = "We have sent you a 4 digit verification code on\n";
  static const String resendText = "Resend in ";
  static const String locationText = "Select Location";
  static const String locationHelpText = "Help us locate you!";
  static const String locationHelpDescText = "This will ensure accurate choice of services";
  static const String locationEnterText = "Enter your Location";
  static const String locationServedText = "Browse Served Locations";
  static const String locationResultText = "Search Results";
  static const String homeDeviceText = "Services by Device";
  static const String homeServiceText = "Special Offers";
  static const String homeMoreText = "What’s on your mind?";
  static const String homeChooseText = "Why choose Us";
  static const String homeFAQText = "Get Your Questions Answered";
  static const String shieldHeadText = "Ultimate Device Protection";
  static const String shieldDescText = "Insurance with a Zip of Reliability and a Shield of Accessibility!";
}

class ButtonText {
  static const String continueText = "Continue";
  static const String otpText = "Send OTP";
  static const String verifyText = "Verify";
  static const String locAccessText = "Access Location";
  static const String locManualText = "Enter Location Manually";
  static const String locSkipText = "Skip";
  static const String locCurrentText = "Use current location using GPS";
  static const String homeFAQText = "Have a question unanswered? Ask Here";
  static const String shieldBuyText = "Buy Insurance";
  static const String shieldClaimText = "Claim Insurance";
  static const String shieldLearnText = "Learn more about Zippy Shield";
}

class TextStyleAll extends TextStyle {
  static TextStyle headLineStyle = GoogleFonts.inter(
    fontSize: 28,
    color: const Color(0xff2967B0),
    fontWeight: FontWeight.w800,
    fontStyle: FontStyle.italic,
    height: 1.43,
  );
  static TextStyle lineStyle = GoogleFonts.inter(
    color: const Color(0xFF0D1F37),
    fontSize: 28,
    fontWeight: FontWeight.w500,
    height: 1.43,
    letterSpacing: -0.70,
  );
  static TextStyle largeLineStyle = GoogleFonts.inter(
    fontSize: 20,
  );
  static TextStyle mediumStyle = GoogleFonts.inter(
    fontSize: 16,
    color: const Color(0xFF686868),
    fontWeight: FontWeight.w500,
    height: 1.31,
  );
  static TextStyle errorTextStyle = GoogleFonts.inter(fontSize: 14);
  static TextStyle smallStyle = GoogleFonts.inter(fontSize: 12);
}
