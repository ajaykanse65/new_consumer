// Container(
//   margin: const EdgeInsets.only(top: 32),
//   padding: const EdgeInsets.only(left: 16),
//   decoration: ShapeDecoration(
//     color: Colors.white,
//     shape: RoundedRectangleBorder(
//       side:  BorderSide(
//         width: 0.50,
//         strokeAlign: BorderSide.strokeAlignCenter,
//         color: authModel.isValidate ?const Color(0xFFDE2C2C) :const Color(0xFFDBDBDB),
//       ),
//       borderRadius: BorderRadius.circular(8),
//     ),
//   ),
//   child: TextFormField(
//     onTap:()=> authModel.setHidden(),
//     controller: authModel.mobileNo,
//     inputFormatters: [
//       LengthLimitingTextInputFormatter(10)
//     ],
//     keyboardType: TextInputType.phone,
//     decoration: InputDecoration(
//         errorStyle: GoogleFonts.inter(
//           color:const Color(0xFFDE2C2C),
//           fontSize: 14,
//           fontWeight: FontWeight.w500,
//           height: 1.43,
//         ),
//         errorText: authModel.isValidate ? 'Enter 10 digits mobile number' : null,
//         hintText: 'Mobile Number',
//         helperStyle: GoogleFonts.inter(
//           color: const Color(0xFF686868),
//           fontSize: 16,
//           fontWeight: FontWeight.w500,
//           letterSpacing: -0.17,
//         ),
//         border: InputBorder.none),
//   ),
// ),