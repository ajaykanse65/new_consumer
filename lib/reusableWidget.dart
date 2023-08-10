
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:new_consumer/static_data/text_static.dart';

class ReusableWidget{
  static Widget footer(){
    return SizedBox(
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
                color: const Color(0xFF59A4FF),
                fontSize: 12,
                fontWeight: FontWeight.w600,
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
                color: const Color(0xFF59A4FF),
                fontSize: 12,
                fontWeight: FontWeight.w600,
                height: 1.50,
              ),
            ),
          ],
        ),
        textAlign: TextAlign.center,
      ),
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
        margin: const EdgeInsets.only(left: 24, right: 24, top: 40),
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
