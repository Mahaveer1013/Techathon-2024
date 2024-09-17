import 'package:flutter/material.dart';
import 'package:health_care_app/screens/doctor_profile_screen.dart';

import '../models/doctor.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final List<Doctor> _allDoctors = [
    Doctor(
      name: 'Dr. Lisa Brown',
      specialty: 'Oncologist',
      hospital: 'Riverfront Medical Center',
      location: 'Chicago',
      rating: '4.2',
      photoUrl: 'assets/images/doctor2.png',
      age: 45,
      gender: 'Female',
      experience: 20,
      availableSlots: ['10:00 AM', '11:00 AM', '02:00 PM'],
      fees: 120.0,
      reviews: ['Very compassionate', 'Highly knowledgeable'],
      workTimings: '9:00 AM - 5:00 PM',
      qualification: 'MD Oncology',
    ),
    Doctor(
      name: 'Dr. Robert Davis',
      specialty: 'Orthopedic Surgeon',
      hospital: 'Sunrise Health Clinic',
      location: 'Houston',
      rating: '4.8',
      photoUrl: 'assets/images/doctor2.png',
      age: 50,
      gender: 'Male',
      experience: 25,
      availableSlots: ['9:30 AM', '01:00 PM', '03:00 PM'],
      fees: 150.0,
      reviews: ['Excellent surgeon', 'Very professional'],
      workTimings: '8:00 AM - 4:00 PM',
      qualification: 'MD Orthopedics',
    ),
    Doctor(
      name: 'Dr. Sophia Garcia',
      specialty: 'Endocrinologist',
      hospital: 'Midtown Health Center',
      location: 'Miami',
      rating: '4.1',
      photoUrl: 'assets/images/doctor2.png',
      age: 40,
      gender: 'Female',
      experience: 15,
      availableSlots: ['11:00 AM', '02:30 PM'],
      fees: 100.0,
      reviews: ['Very attentive', 'Helped manage my condition well'],
      workTimings: '10:00 AM - 5:00 PM',
      qualification: 'MD Endocrinology',
    ),
    Doctor(
      name: 'Dr. David Anderson',
      specialty: 'Gastroenterologist',
      hospital: 'Lakeside Hospital',
      location: 'Orlando',
      rating: '4.4',
      photoUrl: 'assets/images/doctor2.png',
      age: 52,
      gender: 'Male',
      experience: 27,
      availableSlots: ['09:00 AM', '01:00 PM'],
      fees: 140.0,
      reviews: ['Explains everything clearly', 'Great doctor'],
      workTimings: '8:30 AM - 4:00 PM',
      qualification: 'MD Gastroenterology',
    ),
    Doctor(
      name: 'Dr. Linda Martinez',
      specialty: 'Urologist',
      hospital: 'Blue Cross Hospital',
      location: 'Seattle',
      rating: '3.9',
      photoUrl: 'assets/images/doctor2.png',
      age: 48,
      gender: 'Female',
      experience: 23,
      availableSlots: ['10:30 AM', '12:30 PM'],
      fees: 110.0,
      reviews: ['Very understanding', 'Efficient and precise'],
      workTimings: '9:00 AM - 4:30 PM',
      qualification: 'MD Urology',
    ),
    Doctor(
      name: 'Dr. Paul White',
      specialty: 'Ophthalmologist',
      hospital: 'Harborview Medical',
      location: 'Boston',
      rating: '4.6',
      photoUrl: 'assets/images/doctor2.png',
      age: 55,
      gender: 'Male',
      experience: 30,
      availableSlots: ['09:00 AM', '11:30 AM', '02:30 PM'],
      fees: 130.0,
      reviews: ['Highly recommended', 'Very caring'],
      workTimings: '8:00 AM - 5:00 PM',
      qualification: 'MD Ophthalmology',
    ),
    Doctor(
      name: 'Dr. Karen Lewis',
      specialty: 'Pulmonologist',
      hospital: 'Summit Health Center',
      location: 'Atlanta',
      rating: '4.3',
      photoUrl: 'assets/images/doctor2.png',
      age: 46,
      gender: 'Female',
      experience: 21,
      availableSlots: ['10:00 AM', '01:00 PM'],
      fees: 115.0,
      reviews: ['Very thorough', 'Great bedside manner'],
      workTimings: '9:30 AM - 4:30 PM',
      qualification: 'MD Pulmonology',
    ),
    Doctor(
      name: 'Dr. Andrew King',
      specialty: 'Rheumatologist',
      hospital: 'Northwest Hospital',
      location: 'Denver',
      rating: '4.7',
      photoUrl: 'assets/images/doctor2.png',
      age: 50,
      gender: 'Male',
      experience: 26,
      availableSlots: ['08:30 AM', '10:30 AM', '03:00 PM'],
      fees: 135.0,
      reviews: ['Excellent doctor', 'Very patient'],
      workTimings: '8:00 AM - 4:30 PM',
      qualification: 'MD Rheumatology',
    ),
    Doctor(
      name: 'Dr. Nancy Scott',
      specialty: 'Hematologist',
      hospital: 'Central City Hospital',
      location: 'Phoenix',
      rating: '4.0',
      photoUrl: 'assets/images/doctor2.png',
      age: 44,
      gender: 'Female',
      experience: 19,
      availableSlots: ['09:00 AM', '01:30 PM'],
      fees: 125.0,
      reviews: ['Very knowledgeable', 'Good listener'],
      workTimings: '9:00 AM - 5:00 PM',
      qualification: 'MD Hematology',
    ),
    Doctor(
      name: 'Dr. Jason Lee',
      specialty: 'Nephrologist',
      hospital: 'Southpoint Medical Center',
      location: 'Dallas',
      rating: '4.9',
      photoUrl: 'assets/images/doctor2.png',
      age: 53,
      gender: 'Male',
      experience: 28,
      availableSlots: ['08:00 AM', '11:00 AM', '01:00 PM'],
      fees: 140.0,
      reviews: ['Excellent care', 'Highly skilled'],
      workTimings: '8:00 AM - 5:00 PM',
      qualification: 'MD Nephrology',
    ),
    Doctor(
      name: 'Dr. Clara James',
      specialty: 'Dermatologist',
      hospital: 'HealthPlus Clinic',
      location: 'Austin',
      rating: '4.6',
      photoUrl: 'assets/images/doctor2.png',
      age: 47,
      gender: 'Female',
      experience: 22,
      availableSlots: ['10:00 AM', '02:00 PM'],
      fees: 130.0,
      reviews: ['Expert in skincare', 'Helpful recommendations'],
      workTimings: '9:00 AM - 5:00 PM',
      qualification: 'MD Dermatology',
    ),
    Doctor(
      name: 'Dr. Samuel Rodriguez',
      specialty: 'Cardiologist',
      hospital: 'Heartland Hospital',
      location: 'San Diego',
      rating: '4.5',
      photoUrl: 'assets/images/doctor2.png',
      age: 56,
      gender: 'Male',
      experience: 31,
      availableSlots: ['09:00 AM', '12:00 PM', '03:00 PM'],
      fees: 160.0,
      reviews: ['Great cardiologist', 'Very friendly'],
      workTimings: '8:30 AM - 4:30 PM',
      qualification: 'MD Cardiology',
    ),
    Doctor(
      name: 'Dr. Olivia Turner',
      specialty: 'Psychiatrist',
      hospital: 'MindCare Health Center',
      location: 'San Antonio',
      rating: '4.7',
      photoUrl: 'assets/images/doctor2.png',
      age: 49,
      gender: 'Female',
      experience: 24,
      availableSlots: ['11:00 AM', '02:00 PM'],
      fees: 145.0,
      reviews: ['Very empathetic', 'Listens well'],
      workTimings: '9:30 AM - 4:30 PM',
      qualification: 'MD Psychiatry',
    ),
    Doctor(
      name: 'Dr. James Harrison',
      specialty: 'Pediatrician',
      hospital: 'Children\'s Hospital',
      location: 'New York',
      rating: '4.8',
      photoUrl: 'assets/images/doctor2.png',
      age: 54,
      gender: 'Male',
      experience: 29,
      availableSlots: ['08:00 AM', '10:00 AM', '01:30 PM'],
      fees: 135.0,
      reviews: ['Great with kids', 'Very kind and patient'],
      workTimings: '8:00 AM - 4:30 PM',
      qualification: 'MD Pediatrics',
    ),
    Doctor(
      name: 'Dr. Sophia Baker',
      specialty: 'Allergist',
      hospital: 'HealthCare Clinic',
      location: 'Las Vegas',
      rating: '4.2',
      photoUrl: 'assets/images/doctor2.png',
      age: 43,
      gender: 'Female',
      experience: 18,
      availableSlots: ['10:00 AM', '12:00 PM', '02:00 PM'],
      fees: 125.0,
      reviews: ['Very knowledgeable about allergies', 'Great doctor'],
      workTimings: '9:30 AM - 4:00 PM',
      qualification: 'MD Immunology',
    ),
    Doctor(
      name: 'Dr. William Wright',
      specialty: 'Orthodontist',
      hospital: 'Dental Care Clinic',
      location: 'Philadelphia',
      rating: '4.6',
      photoUrl: 'assets/images/doctor2.png',
      age: 49,
      gender: 'Male',
      experience: 24,
      availableSlots: ['08:00 AM', '11:00 AM', '03:00 PM'],
      fees: 140.0,
      reviews: ['Great with braces', 'Explains procedures clearly'],
      workTimings: '8:30 AM - 5:00 PM',
      qualification: 'DDS Orthodontics',
    ),
    Doctor(
      name: 'Dr. Chloe Walker',
      specialty: 'Gynecologist',
      hospital: 'Women\'s Health Center',
      location: 'Washington, D.C.',
      rating: '4.7',
      photoUrl: 'assets/images/doctor2.png',
      age: 50,
      gender: 'Female',
      experience: 26,
      availableSlots: ['09:00 AM', '12:30 PM', '03:30 PM'],
      fees: 135.0,
      reviews: ['Compassionate and experienced', 'Great for women\'s health'],
      workTimings: '9:00 AM - 5:00 PM',
      qualification: 'MD Obstetrics & Gynecology',
    ),
    Doctor(
      name: 'Dr. Daniel Wilson',
      specialty: 'General Practitioner',
      hospital: 'City Health Clinic',
      location: 'Baltimore',
      rating: '4.3',
      photoUrl: 'assets/images/doctor2.png',
      age: 55,
      gender: 'Male',
      experience: 30,
      availableSlots: ['08:00 AM', '10:00 AM', '01:00 PM'],
      fees: 110.0,
      reviews: ['Very knowledgeable', 'Great general care'],
      workTimings: '8:00 AM - 4:00 PM',
      qualification: 'MD General Practice',
    ),
    Doctor(
      name: 'Dr. Victoria Evans',
      specialty: 'Plastic Surgeon',
      hospital: 'Aesthetic Care Center',
      location: 'New Orleans',
      rating: '4.5',
      photoUrl: 'assets/images/doctor2.png',
      age: 48,
      gender: 'Female',
      experience: 23,
      availableSlots: ['09:00 AM', '11:30 AM', '02:00 PM'],
      fees: 180.0,
      reviews: ['Amazing results', 'Expert in plastic surgery'],
      workTimings: '9:00 AM - 4:30 PM',
      qualification: 'MD Plastic Surgery',
    ),
    Doctor(
      name: 'Dr. Michael Green',
      specialty: 'Cardiologist',
      hospital: 'Heart Health Clinic',
      location: 'Sacramento',
      rating: '4.9',
      photoUrl: 'assets/images/doctor2.png',
      age: 57,
      gender: 'Male',
      experience: 32,
      availableSlots: ['08:30 AM', '10:30 AM', '02:00 PM'],
      fees: 170.0,
      reviews: ['Best heart doctor', 'Highly recommended'],
      workTimings: '8:30 AM - 5:00 PM',
      qualification: 'MD Cardiology',
    ),
  ];

  List<Doctor> _filteredDoctors = [];

  @override
  void initState() {
    super.initState();
    _filteredDoctors = _allDoctors;
  }

  void _filterDoctors(String query) {
    final filtered = _allDoctors.where((doctor) {
      final doctorName = doctor.name.toLowerCase();
      final doctorSpecialty = doctor.specialty.toLowerCase();
      final doctorHospital = doctor.hospital.toLowerCase();
      final doctorLocation = doctor.location.toLowerCase();
      final input = query.toLowerCase();

      return doctorName.contains(input) ||
          doctorSpecialty.contains(input) ||
          doctorHospital.contains(input) ||
          doctorLocation.contains(input);
    }).toList();

    setState(() {
      _filteredDoctors = filtered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Input Field
            TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText:
                    'Search doctors by name, specialty, hospital, or location',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged:
                  _filterDoctors, // Call the filter function on text change
            ),
            const SizedBox(height: 16.0),

            const Row(
              children: [
                Text(
                  'Nearby Doctors',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),

            const SizedBox(height: 8.0),

            // Display Search Results
            Expanded(
              child: _filteredDoctors.isNotEmpty
                  ? ListView.builder(
                      itemCount: _filteredDoctors.length,
                      itemBuilder: (context, index) {
                        final doctor = _filteredDoctors[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    DoctorProfileScreen(doctor: doctor),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 4,
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Doctor Image
                                  CircleAvatar(
                                    radius: 40,
                                    backgroundImage:
                                        AssetImage(doctor.photoUrl),
                                  ),
                                  const SizedBox(
                                      width:
                                          10), // spacing between image and info

                                  // Doctor Info
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          doctor.name,
                                          style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 5),
                                        Text(
                                            '${doctor.hospital}, ${doctor.specialty}'),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              color: Colors.yellow,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              doctor.rating,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                                '(${doctor.experience + doctor.age})'),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text('No doctors found'),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
