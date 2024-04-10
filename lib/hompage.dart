import 'package:flutter/material.dart';
import 'offers.dart';
import 'profile.dart';
import 'mainpage.dart';

void main() {
  runApp(const HomeApp());
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Medkit App',
      home: const MainPAge(),
    );
  }
}

class MainPAge extends StatefulWidget {
  const MainPAge({super.key});

  @override
  State<MainPAge> createState() => _MainPAgeState();
}

class _MainPAgeState extends State<MainPAge> {
  int currentPage = 0;
  final screens = [
    HomePage(),
    SchedulePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: currentPage,
          onTap: (index) {
            setState(() {
              currentPage = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: currentPage == 0
                    ? Icon(
                        Icons.home,
                        color: Color.fromARGB(255, 12, 0, 0),
                      )
                    : Icon(
                        Icons.home_outlined,
                        color: Colors.black,
                      ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.local_offer_rounded,
                  color: Colors.black,
                ),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                label: "Home"),
          ]),
    );
  }
}
