import 'package:flutter/material.dart';

class AppointmentCard extends StatelessWidget {
  final Map<String, String> appointment;

  AppointmentCard({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Doctor: ${appointment['doctor']}', style: TextStyle(fontSize: 18)),
            Text('Date: ${appointment['date']}', style: TextStyle(fontSize: 16)),
            Text('Time: ${appointment['time']}', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
