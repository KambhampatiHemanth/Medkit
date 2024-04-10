import 'dart:async';
import 'package:flutter/material.dart';

class AgentDashboard extends StatefulWidget {
  @override
  _AgentDashboardState createState() => _AgentDashboardState();
}

class _AgentDashboardState extends State<AgentDashboard> {
  bool isWorking = false;
  int workDurationInSeconds = 0;
  Timer? workTimer;

  // Define available shift timings and finished shifts.
  List<String> availableShifts = [
    "Morning Shift (8:00 AM - 12:00 PM)",
    "Afternoon Shift (1:00 PM - 5:00 PM)",
    "Night Shift (8:00 PM - 12:00 AM)",
  ];
  List<String> finishedShifts = [];

  String? selectedShift;

  void startWorkTimer() {
    isWorking = true;
    workTimer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        workDurationInSeconds++;
      });
    });
  }

  void stopWorkTimer() {
    if (workTimer != null && workTimer!.isActive) {
      workTimer!.cancel();
    }

    if (selectedShift != null) {
      finishedShifts.add(selectedShift!);
      selectedShift = null;
    }

    setState(() {
      // Update the UI if needed.
      isWorking = false;

      // Calculate total time spent before resetting workDurationInSeconds
      Duration totalTimeSpent = Duration(seconds: workDurationInSeconds);

      // Reset workDurationInSeconds to zero
      workDurationInSeconds = 0;

      // Check if the work duration is zero and show the alert.
      if (totalTimeSpent.inSeconds > 0) {
        _showWorkCompletedAlert(totalTimeSpent);
      }
    });
  }

  void _showWorkCompletedAlert(Duration totalTimeSpent) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Work Completed"),
          content: Text(
            "You have completed your work.\n\n" +
                "Total Time Spent: ${_formatDuration(totalTimeSpent)}",
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Agent Dashboard"),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Agent Name: Agents"),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text("Email: agent@gmail.com"),
          ),
          ListTile(
            leading: Icon(Icons.timer),
            title: Text(
                "Work Duration: ${_formatDuration(Duration(seconds: workDurationInSeconds))}"),
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text("Shift:"),
            trailing: DropdownButton<String>(
              value: selectedShift,
              onChanged: (String? newValue) {
                setState(() {
                  selectedShift = newValue;
                });
              },
              items: availableShifts.map((String shift) {
                return DropdownMenuItem<String>(
                  value: shift,
                  child: Text(shift),
                );
              }).toList(),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (isWorking) {
                stopWorkTimer();
              } else {
                startWorkTimer();
              }
            },
            child: Text(isWorking ? "Stop Work" : "Start Work"),
          ),
          ListTile(
            title: Text("Available Shifts:"),
          ),
          for (String shift in availableShifts)
            ListTile(
              title: Text(shift),
            ),
          ListTile(
            title: Text("Selected Shift:"),
          ),
          for (String shift in finishedShifts)
            ListTile(
              title: Text(shift),
            ),
        ],
      ),
    );
  }

  String _formatDuration(Duration duration) {
    return "${duration.inHours}h ${duration.inMinutes.remainder(60)}m ${duration.inSeconds.remainder(60)}s";
  }
}
