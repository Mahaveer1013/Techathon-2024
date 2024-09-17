class DummyDataService {
  static Map<String, dynamic> getUserData() {
    return {
      "name": "John Doe",
      "appointments": [
        {"doctor": "Dr. Smith", "date": "2024-09-20", "time": "10:00 AM"},
        {"doctor": "Dr. Jane", "date": "2024-09-21", "time": "11:30 AM"},
      ],
      "medications": [
        {"name": "Aspirin", "schedule": "Morning, After meals"},
        {"name": "Vitamin D", "schedule": "Evening"},
      ]
    };
  }
}
