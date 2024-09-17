class Doctor {
  final String name;
  final String specialty;
  final String hospital;
  final String location;
  final String rating;
  final String photoUrl;
  final int age;
  final String gender;
  final int experience;
  final List<String> availableSlots;
  final double fees;
  final List<String> reviews;
  final String workTimings;
  final String qualification;

  Doctor({
    required this.name,
    required this.specialty,
    required this.hospital,
    required this.location,
    required this.rating,
    required this.photoUrl,
    required this.age,
    required this.gender,
    required this.experience,
    required this.availableSlots,
    required this.fees,
    required this.reviews,
    required this.workTimings,
    required this.qualification,
  });
}
