import 'package:flutter/material.dart';
import 'User_login.dart';
import 'agent_login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Set the background color here
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(
          children: [
            Icon(Icons.local_hospital), // Add your icon here
            SizedBox(
              width: 8, // Optional: Add spacing between the icon and title
            ),
            Text(widget.title),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assests/images/photo.png', // Replace with your image path
              width: 300,
              height: 300, // Adjust the width as needed
            ),
            SizedBox(height: 20), // Add spacing between the image and text
            Text("MEDKIT",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)
                // Customize text style as needed
                ),
            SizedBox(height: 20), // Add spacing between the text and buttons
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the buttons horizontally
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AgentApp(),
                      ),
                    );
                  },
                  child: const Text("Agent Login"),
                ),
                SizedBox(width: 20), // Add spacing between the buttons
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => User_LoginApp(),
                      ),
                    );
                  },
                  child: const Text("User Login"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
