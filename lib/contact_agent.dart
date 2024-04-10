import 'package:flutter/material.dart';

void main() {
  runApp(AgentApp());
}

class AgentApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agent Details',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AgentDetailsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AgentDetailsScreen extends StatefulWidget {
  @override
  _AgentDetailsScreenState createState() => _AgentDetailsScreenState();
}

class _AgentDetailsScreenState extends State<AgentDetailsScreen> {
  List<AgentDetails> agents = [
    AgentDetails(
      name: 'Praythusha',
      email: 'Praythusha@gmail.com',
      phoneNumber: '987-654-3210',
      isChecked: false,
    ),
    AgentDetails(
      name: 'Swetha',
      email: 'swetha@gmail.com',
      phoneNumber: '987-654-3211',
      isChecked: false,
    ),
    AgentDetails(
      name: 'Vamsi',
      email: 'vamsi@gmail.com',
      phoneNumber: '987-654-3212',
      isChecked: false,
    ),
    AgentDetails(
      name: 'Sandhya',
      email: 'Sandhya@gmail.com',
      phoneNumber: '987-654-3213',
      isChecked: false,
    ),
    AgentDetails(
      name: 'Mounyasri',
      email: 'Mounyasri@gmail.com',
      phoneNumber: '987-654-3214',
      isChecked: false,
    ),
    // Add more agents here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agent Details'),
      ),
      body: ListView.builder(
        itemCount: agents.length,
        itemBuilder: (context, index) {
          return AgentCard(agent: agents[index]);
        },
      ),
    );
  }
}

class AgentDetails {
  final String name;
  final String email;
  final String phoneNumber;
  bool isChecked;

  AgentDetails({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.isChecked,
  });
}

class AgentCard extends StatefulWidget {
  final AgentDetails agent;

  AgentCard({required this.agent});

  @override
  _AgentCardState createState() => _AgentCardState();
}

class _AgentCardState extends State<AgentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Checkbox(
                value: widget.agent.isChecked,
                onChanged: (bool? value) {
                  setState(() {
                    widget.agent.isChecked = value ?? false;
                  });
                },
              ),
              Text(
                widget.agent.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            'Email: ${widget.agent.email}',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Phone: ${widget.agent.phoneNumber}',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
