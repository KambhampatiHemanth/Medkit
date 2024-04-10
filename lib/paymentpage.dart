// import 'package:flutter/material.dart';
// // import 'hompage.dart';
// import 'Shipping_Address.dart';

// class PaymentPage extends StatefulWidget {
//   final double totalAmount;

//   const PaymentPage({Key? key, required this.totalAmount}) : super(key: key);

//   @override
//   State<PaymentPage> createState() => _PaymentPageState();
// }

// class _PaymentPageState extends State<PaymentPage> {
//   int _type = 1;
//   void handleRadio(Object? e) => setState(() {
//         _type = e as int? ?? _type;
//       });
//   // void makePayment() {
//   //   // Access the total amount using widget.totalAmount
//   //   double totalAmount = widget.totalAmount;

//   //   // Perform payment processing logic here
//   //   // For simplicity, we'll just show an alert for demonstration
//   //   showPaymentAlert(totalAmount);
//   // }

//   // void showPaymentAlert(double totalAmount) {
//   //   // Display an alert box with the message "Payment Successful"
//   //   showDialog(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return AlertDialog(
//   //         title: const Text('Payment Successful'),
//   //         content: Text('Total amount: \$${totalAmount.toStringAsFixed(2)}'),
//   //         actions: [
//   //           ElevatedButton(
//   //             onPressed: () {
//   //               Navigator.push(
//   //                   context,
//   //                   MaterialPageRoute(
//   //                     builder: (context) => HomeApp(),
//   //                   ));
//   //             },
//   //             child: const Text('OK'),
//   //           ),
//   //         ],
//   //       );
//   //     },
//   //   );
//   // }

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Payment Page"),
//         leading: const BackButton(),
//         backgroundColor: Colors.transparent,
//         foregroundColor: Colors.black,
//         elevation: 0,
//         centerTitle: true,
//       ),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Center(
//             child: Column(children: [
//               const SizedBox(height: 40),
//               Container(
//                 width: size.width,
//                 height: 55,
//                 margin: const EdgeInsets.only(right: 20),
//                 decoration: BoxDecoration(
//                     border: _type == 1
//                         ? Border.all(width: 1, color: Colors.red)
//                         : Border.all(width: 0.3, color: Colors.grey),
//                     borderRadius: BorderRadius.circular(5),
//                     color: Colors.transparent),
//                 child: Center(
//                   child: Padding(
//                       padding: const EdgeInsets.only(right: 20),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Radio(
//                                 value: 1,
//                                 groupValue: _type,
//                                 onChanged: handleRadio,
//                                 activeColor: Colors.red,
//                               ),
//                               Text(
//                                 "   PhonePe",
//                                 style: _type == 1
//                                     ? const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black) // TextStyle

//                                     : const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                           Image.asset(
//                             "assests/images/PhonePe.png",
//                             width: 150,
//                             height: 130,
//                             fit: BoxFit.cover,
//                           ),
//                         ],
//                       )),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: size.width,
//                 height: 55,
//                 margin: const EdgeInsets.only(right: 20),
//                 decoration: BoxDecoration(
//                     border: _type == 2
//                         ? Border.all(width: 1, color: Colors.red)
//                         : Border.all(width: 0.3, color: Colors.grey),
//                     borderRadius: BorderRadius.circular(5),
//                     color: Colors.transparent),
//                 child: Center(
//                   child: Padding(
//                       padding: const EdgeInsets.only(right: 20),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Radio(
//                                 value: 2,
//                                 groupValue: _type,
//                                 onChanged: handleRadio,
//                                 activeColor: Colors.red,
//                               ),
//                               Text(
//                                 "   Google Pay",
//                                 style: _type == 2
//                                     ? const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black) // TextStyle

//                                     : const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                           Image.asset(
//                             "assests/images/Gpay.png",
//                             width: 80,
//                             height: 80,
//                             fit: BoxFit.cover,
//                           ),
//                         ],
//                       )),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: size.width,
//                 height: 55,
//                 margin: const EdgeInsets.only(right: 20),
//                 decoration: BoxDecoration(
//                     border: _type == 3
//                         ? Border.all(width: 1, color: Colors.red)
//                         : Border.all(width: 0.3, color: Colors.grey),
//                     borderRadius: BorderRadius.circular(5),
//                     color: Colors.transparent),
//                 child: Center(
//                   child: Padding(
//                       padding: const EdgeInsets.only(right: 20),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Radio(
//                                 value: 3,
//                                 groupValue: _type,
//                                 onChanged: handleRadio,
//                                 activeColor: Colors.red,
//                               ),
//                               Text(
//                                 "   Paytm",
//                                 style: _type == 3
//                                     ? const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black) // TextStyle

//                                     : const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                           Image.asset(
//                             "assests/images/Paytm.png",
//                             width: 100,
//                             height: 100,
//                             fit: BoxFit.cover,
//                           ),
//                         ],
//                       )),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: size.width,
//                 height: 55,
//                 margin: const EdgeInsets.only(right: 20),
//                 decoration: BoxDecoration(
//                     border: _type == 4
//                         ? Border.all(width: 1, color: Colors.red)
//                         : Border.all(width: 0.3, color: Colors.grey),
//                     borderRadius: BorderRadius.circular(5),
//                     color: Colors.transparent),
//                 child: Center(
//                   child: Padding(
//                       padding: const EdgeInsets.only(right: 20),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Radio(
//                                 value: 4,
//                                 groupValue: _type,
//                                 onChanged: handleRadio,
//                                 activeColor: Colors.red,
//                               ),
//                               Text(
//                                 "   Amazon Pay",
//                                 style: _type == 4
//                                     ? const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black) // TextStyle

//                                     : const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                           Image.asset(
//                             "assests/images/Amazon_Pay.png",
//                             width: 150,
//                             height: 120,
//                             fit: BoxFit.cover,
//                           ),
//                         ],
//                       )),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: size.width,
//                 height: 55,
//                 margin: const EdgeInsets.only(right: 20),
//                 decoration: BoxDecoration(
//                     border: _type == 5
//                         ? Border.all(width: 1, color: Colors.red)
//                         : Border.all(width: 0.3, color: Colors.grey),
//                     borderRadius: BorderRadius.circular(5),
//                     color: Colors.transparent),
//                 child: Center(
//                   child: Padding(
//                       padding: const EdgeInsets.only(right: 20),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Row(
//                             children: [
//                               Radio(
//                                 value: 5,
//                                 groupValue: _type,
//                                 onChanged: handleRadio,
//                                 activeColor: Colors.red,
//                               ),
//                               Text(
//                                 "   Cash on Delivery",
//                                 style: _type == 4
//                                     ? const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.black) // TextStyle

//                                     : const TextStyle(
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                         ],
//                       )),
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   // Adjust the padding or margin to move "Total Bill" to the left
//                   Container(
//                     margin: EdgeInsets.only(
//                         left:
//                             3), // Adjust the left margin based on your preference
//                     child: Text(
//                       'Total Bill',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                   // Adjust the padding or margin to move the total amount text to the right
//                   Container(
//                     margin: EdgeInsets.only(
//                         right:
//                             20), // Adjust the right margin based on your preference
//                     child: Text(
//                       '\$${widget.totalAmount.toStringAsFixed(2)}',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w400,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(
//                 height: 140,
//               ),
//               SizedBox(width: 20), // Add spacing between the buttons
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => Shipping_Address(),
//                     ),
//                   );
//                 },
//                 child: const Text("User Login"),
//               ),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
