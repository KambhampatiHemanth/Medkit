import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'OrderConfirm.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Shipping Address"),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Full Name",
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                TextFormField(
                  keyboardType:
                      TextInputType.phone, // Set keyboard type to phone
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(
                        10), // Limit input to 10 characters
                    FilteringTextInputFormatter
                        .digitsOnly, // Allow only numeric input
                  ],
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Mobile Number",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Address",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "City",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "City/Region",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Postal Code(PinCode)",
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Country",
                  ),
                ),
                SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    var widget;
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => OrderConfirmScreen(
                          totalBill: widget.totalBill,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red, // Background color
                    onPrimary: Colors.white, // Text color
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 130),
                  ),
                  child: const Text(
                    'Add Address',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ContainerButtonModel extends StatelessWidget {
  final String buttonText;
  final double containerWidth;
  final Color bgColor;

  const ContainerButtonModel({
    required this.buttonText,
    required this.containerWidth,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      child: ElevatedButton(
        onPressed: () {
          // Add your button click logic here
        },
        style: ElevatedButton.styleFrom(
          primary: bgColor,
          padding: const EdgeInsets.symmetric(vertical: 15),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
    );
  }
}
