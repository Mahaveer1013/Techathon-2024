import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../models/doctor.dart';

class DoctorProfileScreen extends StatelessWidget {
  final Doctor doctor;

  DoctorProfileScreen({required this.doctor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${doctor.name}\'s Profile',
            style: const TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor's Photo with Name, Age, and Gender
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(doctor.photoUrl),
                  ),
                  const SizedBox(height: 12.0),
                  Text(
                    doctor.name,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${doctor.age} years old, ${doctor.gender}',
                    style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),

            // Doctor Info (Specialty, Hospital, Location)
            _buildSectionTitle('Doctor Information'),
            _buildInfoRow(
                FontAwesomeIcons.stethoscope, 'Specialty', doctor.specialty),
            _buildInfoRow(
                FontAwesomeIcons.hospital, 'Hospital', doctor.hospital),
            _buildInfoRow(
                FontAwesomeIcons.mapMarkerAlt, 'Location', doctor.location),

            // Experience and Work Timings
            const SizedBox(height: 24.0),
            _buildSectionTitle('Professional Details'),
            _buildInfoRow(FontAwesomeIcons.briefcase, 'Experience',
                '${doctor.experience} years'),
            _buildInfoRow(
                FontAwesomeIcons.clock, 'Work Timings', doctor.workTimings),

            // Qualification
            const SizedBox(height: 24.0),
            _buildSectionTitle('Qualification'),
            _buildInfoRow(FontAwesomeIcons.graduationCap, 'Qualification',
                doctor.qualification),

            // Available Slots (Calendar)
            const SizedBox(height: 24.0),
            _buildSectionTitle('Available Slots'),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: doctor.availableSlots
                  .map((slot) => Chip(
                        label: Text(slot),
                        backgroundColor: Colors.teal.withOpacity(0.1),
                      ))
                  .toList(),
            ),

            // Fees
            const SizedBox(height: 24.0),
            _buildSectionTitle('Consultation Fees'),
            _buildInfoRow(
                FontAwesomeIcons.dollarSign, 'Fees', '\$${doctor.fees}'),

            // Reviews Section
            const SizedBox(height: 24.0),
            _buildSectionTitle('Patient Reviews'),
            ...doctor.reviews.map((review) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: _buildReviewCard(review),
                )),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      _openBookingModal(context, doctor);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '+ Book Appointment',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Helper method to build section titles
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
    );
  }

  // Helper method to build information rows
  Widget _buildInfoRow(IconData icon, String label, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.teal, size: 20),
          SizedBox(width: 10),
          Text(
            '$label: ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Text(
              info,
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build review cards
  Widget _buildReviewCard(String review) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const Icon(FontAwesomeIcons.solidStar,
                color: Colors.amber, size: 16),
            const SizedBox(width: 10),
            Expanded(child: Text(review, style: const TextStyle(fontSize: 14))),
          ],
        ),
      ),
    );
  }

  // Booking Modal Bottom Sheet
  void _openBookingModal(BuildContext context, Doctor doctor) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return BookingModal(doctor: doctor);
      },
    );
  }
}

class BookingModal extends StatefulWidget {
  final Doctor doctor;

  BookingModal({required this.doctor});

  @override
  _BookingModalState createState() => _BookingModalState();
}

class _BookingModalState extends State<BookingModal> {
  DateTime? selectedDate;
  String? selectedTime;
  String? consultationType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Select Date',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          // Date Picker
          ElevatedButton(
            onPressed: () => _selectDate(context),
            child: Text(
              selectedDate == null
                  ? 'Choose Date'
                  : '${selectedDate!.toLocal()}'.split(' ')[0],
              style: const TextStyle(fontSize: 16),
            ),
          ),
          const SizedBox(height: 20),

          const Text('Select Time',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          // Vertical time scroller
          _buildVerticalTimeScroller(),
          const SizedBox(height: 20),

          const Text('Consultation Type',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildConsultationOption('Online', FontAwesomeIcons.video),
              _buildConsultationOption('Offline', FontAwesomeIcons.home),
            ],
          ),
          const SizedBox(height: 20),

          Center(
            child: ElevatedButton(
              onPressed: (selectedDate != null &&
                      selectedTime != null &&
                      consultationType != null)
                  ? () {
                      _showFeeAndProceed(context);
                    }
                  : null, // Disable until all options are selected
              child: const Text('Book Appointment'),
            ),
          ),
        ],
      ),
    );
  }

  // Date Picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  // Vertical time scroller
  Widget _buildVerticalTimeScroller() {
    List<String> timeSlots = List.generate(12, (index) {
      final startHour = 9 + index;
      final endHour = startHour + 1;
      return '${startHour}:00 - ${endHour}:00';
    });

    return Container(
      height: 30,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: timeSlots.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => setState(() {
              selectedTime = timeSlots[index];
            }),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: selectedTime == timeSlots[index]
                    ? Colors.teal
                    : Colors.teal.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.teal,
                  width: 1,
                ),
              ),
              child: Center(
                child: Text(
                  timeSlots[index],
                  style: TextStyle(
                    fontSize: 16,
                    color: selectedTime == timeSlots[index]
                        ? Colors.white
                        : Colors.teal,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  // Helper method to build consultation type options
  Widget _buildConsultationOption(String type, IconData icon) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            consultationType = type;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: consultationType == type
                ? Colors.teal
                : Colors.teal.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                type,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Show fee and proceed to payment
  void _showFeeAndProceed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Appointment'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  'Date: ${selectedDate?.toLocal().toString().split(' ')[0] ?? 'Not selected'}'),
              Text('Time: $selectedTime'),
              Text('Consultation Type: $consultationType'),
              Text('Fees: \$${widget.doctor.fees}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _processPayment(context);
              },
              child: const Text('Confirm & Pay'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  // Process Stripe payment
  void _processPayment(BuildContext context) {
    // Here, you would integrate with Stripe for the actual payment processing.
    // This can involve using the stripe_payment package or integrating with Stripe's API directly.

    // Example of processing payment:
    // StripePayment.paymentRequestWithCardForm(
    //   CardFormPaymentRequest(),
    // ).then((paymentMethod) {
    //   // Handle successful payment
    // }).catchError((error) {
    //   // Handle error
    // });
  }
}
