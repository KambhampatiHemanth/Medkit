import 'package:flutter/material.dart';

void main() {
  runApp(LabtestApp());
}

class LabtestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab Tests',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LabTestList(),
    );
  }
}

class LabTestList extends StatefulWidget {
  @override
  _LabTestListState createState() => _LabTestListState();
}

class _LabTestListState extends State<LabTestList> {
  List<LabTest> labTests = [
    LabTest(
        name: 'Full Body Check up', description: 'Body Checkup description'),
    LabTest(name: 'Complete Blood Count', description: 'CBC test description'),
    LabTest(name: 'Lipid Profile', description: 'Lipid Profile description'),
    LabTest(
        name: 'Thyroid Function Tests',
        description: 'Thyroid test description'),
    // Add more lab tests as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab Tests'),
      ),
      body: ListView.builder(
        itemCount: labTests.length,
        itemBuilder: (context, index) {
          final labTest = labTests[index];
          return ListTile(
            title: Text(labTest.name),
            subtitle: Text(labTest.description),
            trailing: Checkbox(
              value: labTest.isSelected,
              onChanged: (bool? newValue) {
                setState(() {
                  labTest.isSelected = newValue!;
                });
              },
            ),
          );
        },
      ),
    );
  }
}

class LabTest {
  final String name;
  final String description;
  bool isSelected;

  LabTest({
    required this.name,
    required this.description,
    this.isSelected = false,
  });
}
