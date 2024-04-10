import 'package:flutter/material.dart';
import 'package:medkit_application/OrderConfirm.dart';
import 'hompage.dart';
import 'Payment.dart';

void main() => runApp(MedicineSearchApp());

class MedicineSearchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medicine Search and Cart',
      routes: {
        '/': (context) => MedicineSearchPage(),
        '/main': (context) => HomeApp(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MedicineSearchPage extends StatefulWidget {
  get totalAmount => null;

  @override
  _MedicineSearchPageState createState() => _MedicineSearchPageState();
}

class _MedicineSearchPageState extends State<MedicineSearchPage> {
  final List<Medicine> medicines = [
    Medicine('Aspirin', 6.00),
    Medicine('Allen Otovin Ear Drop', 50.00),
    Medicine('Benadryl', 150.00),
    Medicine('Cipla Eye/Ear Drops', 15.00),
    Medicine('Cipladine', 50.00),
    Medicine('Ciplox Eye/Ear Drops', 12.00),
    Medicine('Crocin Advance 500mg Tablet', 20.00),
    Medicine('Dolo 650', 10.00),
    Medicine('Dr Ortho an Ayurvedic Medicine Oil(60 ml)', 145.00),
    Medicine('Dr Ortho an Ayurvedic Medicine Oil(120 ml)', 265.00),
    Medicine('Duphalac Oral Solution Lemon(450 ml)', 500.00),
    Medicine('Eno Fruit Salt Sachet (5gm Each of 6 Sachets) Lemon', 55.00),
    Medicine('Himalaya Gasex Tablet(1 Bottle of 100 tablets)', 150.00),
    Medicine('Iodex Rapid Action Spray(35 gms)', 134.00),
    Medicine('Iodex Rapid Action Spray(60 gms)', 185.00),
    Medicine('Otrivin Oxy Fast Relief Adult Nasal Spray', 90.00),
    Medicine('Paracetamol 500', 10.00),
    Medicine('Saridon for Fast Headache Relief Tablet', 45.00),
    Medicine('SBL Bio-Combination(25 gms)', 100.00),
    Medicine('Tata 1mg Antacid Gel and Sugar Free Mint(200 ml)', 110.00),
    Medicine('Tata 1mg Antacid Gel and Sugar Free Mint(450 ml)', 170.00),
    Medicine('Tata 1mg Digital Thermometer ', 100.00),
    Medicine('Volini Spray for sprain, muscle and joint pain(15 gms)', 60.00),
    Medicine('Volini Spray for sprain, muscle and joint pain(60 gms)', 180.00),
    Medicine('Volini Spray for sprain, muscle and joint pain(100 gms)', 290.00),
    Medicine('Zandu Pancharishta Ayurvedic Digestive Tonic(200 ml)', 75.00),
    Medicine('Zandu Pancharishta Ayurvedic Digestive Tonic(450 ml)', 120.00),
    Medicine('Zandu Pancharishta Ayurvedic Digestive Tonic(650 ml)', 158.00),
    Medicine('Zincovit Tablet(15 plates)', 90.00),
    Medicine('Zincovit Syrup(200 ml)', 140.00),
  ];

  List<Medicine> searchResult = [];

  void _searchMedicines(String query) {
    searchResult.clear();
    searchResult.addAll(medicines.where((medicine) =>
        medicine.name.toLowerCase().contains(query.toLowerCase())));
  }

  final List<Medicine> cart = [];
  double totalBill = 0.0;

  void addItemToCart(Medicine medicine) {
    setState(() {
      cart.add(medicine);
      totalBill += medicine.price;
    });
  }

  void processPayment() {
    if (cart.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OrderConfirmScreen(
            totalBill: widget.totalAmount,
          ),
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Empty Cart'),
            content:
                Text('Your cart is empty. Add items before making a payment.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void clearCart() {
    setState(() {
      cart.clear();
      totalBill = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine Search and Cart'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushNamed(context,
                '/main'); // This line will navigate back to the previous screen
          },
        ),
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    _searchMedicines(value);
                  });
                },
                decoration: InputDecoration(
                  hintText: 'Search for medicines...',
                ),
              )),
          Expanded(
            child: ListView.builder(
              itemCount: searchResult.length,
              itemBuilder: (context, index) {
                final medicine = searchResult[index];
                return ListTile(
                  title: Text(medicine.name),
                  subtitle: Text('\$${medicine.price.toStringAsFixed(2)}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      addItemToCart(medicine);
                    },
                    child: Text('Add to Cart'),
                  ),
                );
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Cart'),
            trailing: ElevatedButton(
              onPressed: () {
                if (cart.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          PaymentPage(totalBill: totalBill, cartItems: cart),
                    ),
                  );
                } else {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Empty Cart'),
                        content: Text(
                            'Your cart is empty. Add items before making a payment.'),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              child: const Text("Proceed to pay"),
            ),
          ),

          //     ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => PaymentApp(),
          //         ));
          //   },
          //   child: const Text("Proceed to pay"),
          // )
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final cartItem = cart[index];
                return ListTile(
                  title: Text(cartItem.name),
                  subtitle: Text('\$${cartItem.price.toStringAsFixed(2)}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      removeItemFromCart(index);
                    },
                    child: Text('Remove'),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Total Bill: \$${totalBill.toStringAsFixed(2)}'),
          ),
        ],
      ),
    );
  }

  void removeItemFromCart(int index) {
    setState(() {
      totalBill -= cart[index].price;
      cart.removeAt(index);
    });
  }
}

class Medicine {
  final String name;
  final double price;

  Medicine(this.name, this.price);
}
