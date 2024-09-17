import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String imageUrl;

  DoctorCard({required this.name, required this.specialty, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: Image.asset(imageUrl, width: 50, height: 50),
        title: Text(name),
        subtitle: Text(specialty),
        trailing: IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {
            // Navigate to doctor details or booking screen
          },
        ),
      ),
    );
  }
}
