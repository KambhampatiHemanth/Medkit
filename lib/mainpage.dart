import 'package:flutter/material.dart';
import 'medicine_search.dart';
import 'lab_test.dart';
import 'offers.dart';
import 'contact_agent.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

void main() {
  runApp(const HomePage());
}

class MainpageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position? _currentPosition;
  String _currentAddress = '';

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  // Function to get the user's current location
  Future<void> _getLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = position;
      });

      _getAddressFromPosition();
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  // Function to get the address from latitude and longitude
  _getAddressFromPosition() async {
    try {
      List<Placemark> placemarks = await placemarkFromPosition(
        _currentPosition!,
        localeIdentifier: 'en_US', // Add this line if needed
      );

      Placemark place = placemarks[0];

      setState(() {
        _currentAddress = "${place.locality}, ${place.country}";
        // Use _currentAddress as needed in your UI
      });
    } catch (e) {
      print('Error getting location or address: $e');
    }
  }

  Future<List<Placemark>> placemarkFromPosition(Position position,
      {String localeIdentifier = 'en_US'}) async {
    try {
      return await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
        localeIdentifier: localeIdentifier,
      );
    } catch (e) {
      print(e);
      return [];
    }
  }
  // List<String> locations = [
  //   'Vijayawada',
  //   'Hyderabad',
  //   'Mumbai',
  //   'Chennai',
  //   'Bengaluru'
  // ];
  // String selectedLocation = 'Vijayawada'; // Default location

  void goToMedicinePage() {
    // Add your navigation logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundImage: AssetImage('assests/images/doc.png'),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome back",
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Medkit",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 35,
                        color: Colors.orange,
                      ),
                      Text(
                        ' $_currentAddress',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // DropdownButton<String>(
                      //   value: selectedLocation,
                      //   onChanged: (String? newValue) {
                      //     setState(() {
                      //       selectedLocation = newValue!;
                      //     });
                      //   },
                      //   items: locations.map((String location) {
                      //     return DropdownMenuItem<String>(
                      //       value: location,
                      //       child: Text(location),
                      //     );
                      //   }).toList(),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MedicineSearchApp(),
                    ));
              },
              child: const Text("Go to Medicine Search Page"),
            ),
            SizedBox(height: 15),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      // animation or cute picture
                      Image.asset('assests/images/lablogo.jpg'),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lab Tests",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'Lab Test Details',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LabTestList(),
                                  ));
                            },
                            child: const Text("Lab Test"),
                          ),
                        ],
                      )),
                    ],
                  ),
                )
// Add the rest of your page content below the search bar
                ),
            SizedBox(height: 15),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Image.asset('assests/images/offer.png'),
                      SizedBox(
                        width: 20,
                      ),

                      //how do you feel + get started buuton
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Offers",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'It will navigate to offers',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 12),
                          SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SchedulePage(),
                                  ));
                            },
                            child: const Text("Offers Zone"),
                          ),
                        ],
                      )),
                    ],
                  ),
                )
// Add the rest of your page content below the search bar
                ),
            SizedBox(height: 15),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  padding: EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFE0B2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Image.asset('assests/images/agent.jpg'),
                      SizedBox(
                        width: 20,
                      ),

                      //how do you feel + get started buuton
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Agents Near By",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 12),
                          Text(
                            'It shows Agents near by you',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 12),
                          SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AgentDetailsScreen(),
                                  ));
                            },
                            child: const Text("Contact Agents"),
                          ),
                        ],
                      )),
                    ],
                  ),
                )
// Add the rest of your page content below the search bar

                ),
          ],
        ),
      ),
    );
  }
}
