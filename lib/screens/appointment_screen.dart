import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class Appointment {
  final String title;
  final DateTime time;
  final String description;

  Appointment(
      {required this.title, required this.time, required this.description});
}

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  List<Appointment> appointments = [];
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
    _loadAppointments();
  }

  void _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void _loadAppointments() {
    // Load your booked appointments (sample data)
    appointments = [
      Appointment(
          title: 'Doctor Consultation',
          time: DateTime.now().add(Duration(hours: 2)),
          description: 'General check-up with Dr. Smith'),
      Appointment(
          title: 'Dentist Appointment',
          time: DateTime.now().add(Duration(days: 1, hours: 4)),
          description: 'Routine dental cleaning with Dr. Brown'),
      Appointment(
          title: 'Doctor Consultation',
          time: DateTime.now().add(Duration(hours: 2)),
          description: 'General check-up with Dr. Smith'),
      Appointment(
          title: 'Dentist Appointment',
          time: DateTime.now().add(Duration(days: 1, hours: 4)),
          description: 'Routine dental cleaning with Dr. Brown'),
      Appointment(
          title: 'Doctor Consultation',
          time: DateTime.now().add(Duration(hours: 2)),
          description: 'General check-up with Dr. Smith'),
      Appointment(
          title: 'Dentist Appointment',
          time: DateTime.now().add(Duration(days: 1, hours: 4)),
          description: 'Routine dental cleaning with Dr. Brown'),
      Appointment(
          title: 'Doctor Consultation',
          time: DateTime.now().add(Duration(hours: 2)),
          description: 'General check-up with Dr. Smith'),
      Appointment(
          title: 'Dentist Appointment',
          time: DateTime.now().add(Duration(days: 1, hours: 4)),
          description: 'Routine dental cleaning with Dr. Brown'),
      // Add more appointments here...
    ];
  }

  void _scheduleReminder(Appointment appointment) async {
    // Initialize time zone data
    tz.initializeTimeZones();

    final tz.TZDateTime scheduledDate = tz.TZDateTime.from(
      appointment.time.subtract(Duration(minutes: 30)),
      tz.local, // Ensure you are using the local time zone
    );

    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'reminder_channel_id',
      'Reminders',
      importance: Importance.max,
      priority: Priority.high,
      // Add other settings as necessary
    );

    final NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      // Add iOS details if needed
    );

    await flutterLocalNotificationsPlugin.zonedSchedule(
      appointment.hashCode, // Unique ID for each appointment
      'Reminder: ${appointment.title}',
      'Your appointment for "${appointment.title}" is coming up.',
      scheduledDate,
      platformDetails,
      androidAllowWhileIdle: true,
      // Allow notifications to be delivered even if the device is idle
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: appointments.isEmpty
          ? Center(child: Text('No appointments booked'))
          : ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                final appointment = appointments[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(appointment.title),
                    subtitle: Text(
                        '${appointment.description}\n${_formatDateTime(appointment.time)}'),
                    trailing: IconButton(
                      icon: Icon(Icons.notifications),
                      onPressed: () {
                        _scheduleReminder(appointment);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Reminder set for ${appointment.title}')),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year} at ${dateTime.hour}:${dateTime.minute}';
  }
}
