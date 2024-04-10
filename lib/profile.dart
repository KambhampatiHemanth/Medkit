import 'package:flutter/material.dart';
import 'User_login.dart';
import 'hompage.dart';

void main() {
  runApp(OffersApp());
}

class OffersApp extends StatelessWidget {
  const OffersApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => ProfilePage(),
        '/main': (context) => HomeApp(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfilePage extends StatelessWidget {
  // Sample data for total donations
  final int totalDonations = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundColor: Colors.blue,
            ),
            SizedBox(height: 16.0),
            Text(
              "Kambhampati Hemanth",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              "kambhampatihemanth@gmail.com",
              style: TextStyle(fontSize: 16.0),
            ),
            // SizedBox(height: 8.0),
            // Divider(),
            // Expanded(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Column(
            //         children: [
            //           Text(
            //             "Total Recipe's Visited",
            //             style: TextStyle(
            //               fontSize: 16.0,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           Text(
            //             "41",
            //             style: TextStyle(fontSize: 14.0),
            //           ),
            //         ],
            //       ),
            //       Column(
            //         children: [
            //           Text(
            //             "Total Donations Done",
            //             style: TextStyle(
            //               fontSize: 16.0,
            //               fontWeight: FontWeight.bold,
            //             ),
            //           ),
            //           Text(
            //             "10",
            //             style: TextStyle(fontSize: 14.0),
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            Divider(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => User_LoginApp(),
                    ));
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
