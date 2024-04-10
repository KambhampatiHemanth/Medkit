import 'package:flutter/material.dart';
import 'hompage.dart';

class OffersApp extends StatelessWidget {
  const OffersApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const OffersPage(),
        '/main': (context) => HomeApp(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class OffersPage extends StatefulWidget {
  const OffersPage({super.key});

  @override
  State<OffersPage> createState() => _OffersPage();
}

class _OffersPage extends State<OffersPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, '/main'); // Navigate back to the home page
          },
        ),
        title: Text('Offers Zone'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    title: Text("COUPON NAME: NEWUSER"),
                    subtitle: Text("Flat 50% off for new user"),
                  ),
                  ListTile(
                    title: Text("COUPON NAME: LITTLE"),
                    subtitle: Text(
                        "Flat 15% off on medicine above purchase of 2000/-"),
                  ),
                  ListTile(
                    title: Text("COUPON NAME: GET20"),
                    subtitle: Text(
                        "Flat 20% off on medicine above purchase of 2500/-"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
