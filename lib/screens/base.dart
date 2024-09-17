import 'package:flutter/material.dart';
import 'package:health_care_app/screens/dashboard.dart';
import 'package:health_care_app/screens/search_screen.dart';

import 'appointment_screen.dart';
import 'chat_screen.dart'; // You need to add the actual screen imports
import 'medication_screen.dart';

class BaseScreen extends StatefulWidget {
  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  int _currentIndex = 0;

  // List of pages
  final List<Widget> _pages = [
    DashboardScreen(),
    SearchScreen(),
    ChatScreen(), // Replace with your message page
    AppointmentScreen(),
    MedicationScreen(),
  ];

  // List of page titles
  final List<String> _titles = [
    'Dashboard',
    'Explore',
    'Messages',
    'Appointments',
    'Prescribed Medications',
  ];

  // To track current page index and title
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]), // Change the title dynamically
        actions: [
          Icon(
            Icons.notifications,
            size: 30,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages, // Manage pages with IndexedStack
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: _onTabTapped,
        // Handle navigation
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Medications',
          ),
        ],
      ),
    );
  }
}
