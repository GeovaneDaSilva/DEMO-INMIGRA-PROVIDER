// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';

// class ScannerScreen extends StatelessWidget {
//   const ScannerScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ElevatedButton(
//                 onPressed: () {
//                   EasyLoading.show(status: 'Connecting...');

//                   Future.delayed(const Duration(seconds: 3), () {
//                     EasyLoading.dismiss();
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => Screen4()),
//                     ).then((_) {
//                       showDialog(
//                         context: context,
//                         builder: (context) => AlertDialog(
//                           title: const Text('Payment Done'),
//                           content: const Text('Your payment was successful.'),
//                           actions: [
//                             TextButton(
//                               onPressed: () {
//                                 Navigator.pop(context); // Close the dialog
//                               },
//                               child: const Text('OK'),
//                             ),
//                           ],
//                         ),
//                       );
//                     });
//                   });
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.pink,
//                   padding: EdgeInsets.symmetric(horizontal: 122, vertical: 16),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   elevation: 5,
//                   shadowColor: Colors.grey.withOpacity(0.5),
//                 ),
//                 child: Text(
//                   'Pay Now',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 16,
//                   ),
//                 ),
//               ),
//     );
//   }
// }