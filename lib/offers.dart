import 'package:flutter/material.dart';
import 'hompage.dart';

class OffersApp extends StatelessWidget {
  const OffersApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const SchedulePage(),
        '/main': (context) => HomeApp(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class SchedulePage extends StatefulWidget {
  const SchedulePage({super.key});

  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offers Page'),
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
