class Medication {
  final String id;
  final String name;
  final String userId;
  final String dosage;
  final String frequency;
  final String timing;  // before/after meals, etc.

  Medication({required this.id, required this.name, required this.userId, required this.dosage, required this.frequency, required this.timing});
}
