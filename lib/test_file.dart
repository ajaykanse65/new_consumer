// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MaterialApp(home: OTPPage()));
// }
//
// class OTPPage extends StatefulWidget {
//   @override
//   _OTPPageState createState() => _OTPPageState();
// }
//
// class _OTPPageState extends State<OTPPage> {
//   final List<TextEditingController> _otpControllers = List.generate(4, (index) => TextEditingController(),);
//
//   bool get areAllOTPsFilled => _otpControllers.every((controller) => controller.text.isNotEmpty);
//
//   @override
//   void dispose() {
//     for (final controller in _otpControllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('OTP Verification')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: List.generate(
//                 4,
//                     (index) => SizedBox(
//                   width: 50,
//                   child: TextField(
//                     controller: _otpControllers[index],
//                     maxLength: 1,
//                     textAlign: TextAlign.center,
//                     keyboardType: TextInputType.number,
//                     onChanged: (value) {
//                       if (value.isNotEmpty && index < _otpControllers.length - 1) {
//                         FocusScope.of(context).nextFocus();
//                       }
//                       setState(() {});
//                     },
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: areAllOTPsFilled ? () {} : null,
//               style: ElevatedButton.styleFrom(
//                 primary: areAllOTPsFilled ? Colors.blue : Colors.grey,
//               ),
//               child: Text('Verify'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
