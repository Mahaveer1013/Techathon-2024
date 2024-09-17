import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:health_care_app/widgets/custom_button.dart';
import 'package:timezone/timezone.dart' as tz;

class Medication {
  final String name;
  final String dosage;
  final String timing;
  final String beforeOrAfterFood;
  final String frequency;

  Medication({
    required this.name,
    required this.dosage,
    required this.timing,
    required this.beforeOrAfterFood,
    required this.frequency,
  });
}

class MedicationScreen extends StatefulWidget {
  const MedicationScreen({super.key});

  @override
  _MedicationScreenState createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
  late FlutterLocalNotificationsPlugin localNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  void _initializeNotifications() {
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);

    localNotificationsPlugin.initialize(initializationSettings);
  }

  Future<void> _scheduleReminder(Medication medication) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'medication_channel',
      'Medication Reminders',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidDetails);

    // Schedule a notification based on medication timing (for demo, setting 5 seconds later)
    await localNotificationsPlugin.zonedSchedule(
      0, // Notification ID
      'Time to take your medicine!',
      '${medication.name}, ${medication.dosage}',
      _convertTimeToTZDateTime(medication.timing),
      // Converts to the correct time
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents:
          DateTimeComponents.time, // Remind on specified time daily
    );
  }

  tz.TZDateTime _convertTimeToTZDateTime(String timing) {
    final now = tz.TZDateTime.now(tz.local);
    int hour;

    switch (timing.toLowerCase()) {
      case 'morning':
        hour = 8; // Example morning time
        break;
      case 'afternoon':
        hour = 12; // Example afternoon time
        break;
      case 'evening':
        hour = 18; // Example evening time
        break;
      default:
        hour = 8; // Default to morning if not specified
    }

    return tz.TZDateTime(tz.local, now.year, now.month, now.day, hour);
  }

  @override
  Widget build(BuildContext context) {
    final List<Medication> medications = [
      Medication(
        name: 'Paracetamol',
        dosage: '500 mg',
        timing: 'Morning',
        beforeOrAfterFood: 'After food',
        frequency: 'Once a day',
      ),
      Medication(
        name: 'Amoxicillin',
        dosage: '250 mg',
        timing: 'Evening',
        beforeOrAfterFood: 'Before food',
        frequency: 'Twice a day',
      ),
      Medication(
        name: 'Vitamin D',
        dosage: '1000 IU',
        timing: 'Afternoon',
        beforeOrAfterFood: 'With food',
        frequency: 'Once a day',
      ),
    ];

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: medications.length,
        itemBuilder: (context, index) {
          final medication = medications[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        medication.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CustomButton(
                        text: '+ Add Reminder',
                        onPressed: () {
                          _scheduleReminder(medication);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Reminder set for ${medication.timing}!'),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text('Dosage: ${medication.dosage}'),
                  Text('Timing: ${medication.timing}'),
                  Text('Before/After Food: ${medication.beforeOrAfterFood}'),
                  Text('Frequency: ${medication.frequency}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
