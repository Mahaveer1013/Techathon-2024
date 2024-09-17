import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Greeting Section
            _buildGreetingSection(),

            // Recent Checkups
            _buildRecentCheckups(),

            // Charts
            SizedBox(height: 20),
            _buildChartsSection(),

            // Medication Section
            SizedBox(height: 20),
            _buildMedicationSection(),

            // Health Reports and Analytics
            SizedBox(height: 20),
            _buildHealthReportsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildGreetingSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: Colors.teal.withOpacity(0.3),
              child: Icon(Icons.person, size: 40, color: Colors.teal),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome, John Doe!',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text('Here’s your latest health summary'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentCheckups() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Recent Checkups', style: TextStyle(fontSize: 18)),
            Divider(),
            ListTile(
              leading: Icon(Icons.local_hospital, color: Colors.teal),
              title: Text('Dr. Jane Smith - Cardiologist'),
              subtitle: Text('Last checkup: Sep 12, 2024'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to detailed report
              },
            ),
            ListTile(
              leading: Icon(Icons.local_hospital, color: Colors.teal),
              title: Text('Dr. Mark Lee - Endocrinologist'),
              subtitle: Text('Last checkup: Aug 25, 2024'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to detailed report
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Health Report Comparison', style: TextStyle(fontSize: 18)),
        SizedBox(height: 10),
        SizedBox(
          height: 200,
          child: _buildHealthReportChart(),
        ),
        SizedBox(height: 20),
        Text('Medication Compliance', style: TextStyle(fontSize: 18)),
        SizedBox(height: 10),
        _buildMedicationComplianceChart(),
      ],
    );
  }

  Widget _buildHealthReportChart() {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceBetween,
        titlesData: FlTitlesData(show: true),
        borderData: FlBorderData(show: true),
        barGroups: [
          BarChartGroupData(
            x: 0,
            barRods: [
              BarChartRodData(
                toY: 120,
                color: Colors.teal,
                width: 16,
              ),
            ],
          ),
          BarChartGroupData(
            x: 1,
            barRods: [
              BarChartRodData(
                toY: 125,
                color: Colors.teal,
                width: 16,
              ),
            ],
          ),
          BarChartGroupData(
            x: 2,
            barRods: [
              BarChartRodData(
                toY: 130,
                color: Colors.teal,
                width: 16,
              ),
            ],
          ),
          BarChartGroupData(
            x: 3,
            barRods: [
              BarChartRodData(
                toY: 135,
                color: Colors.teal,
                width: 16,
              ),
            ],
          ),
          BarChartGroupData(
            x: 4,
            barRods: [
              BarChartRodData(
                toY: 140,
                color: Colors.teal,
                width: 16,
              ),
            ],
          ),
        ],
        gridData: FlGridData(show: false),
      ),
    );
  }

  Widget _buildMedicationComplianceChart() {
    return LinearProgressIndicator(
      value: 0.75,
      color: Colors.teal,
      backgroundColor: Colors.teal.withOpacity(0.3),
    );
  }

  Widget _buildMedicationSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Medications', style: TextStyle(fontSize: 18)),
            Divider(),
            ListTile(
              leading: Icon(Icons.medical_services, color: Colors.teal),
              title: Text('Atorvastatin'),
              subtitle: Text('Dosage: 20mg'),
              trailing: Icon(Icons.alarm, color: Colors.teal),
              onTap: () {
                // Set medication reminder
              },
            ),
            ListTile(
              leading: Icon(Icons.medical_services, color: Colors.teal),
              title: Text('Metformin'),
              subtitle: Text('Dosage: 500mg'),
              trailing: Icon(Icons.alarm, color: Colors.teal),
              onTap: () {
                // Set medication reminder
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHealthReportsSection() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Health Reports', style: TextStyle(fontSize: 18)),
            Divider(),
            ListTile(
              leading: Icon(Icons.report, color: Colors.teal),
              title: Text('Cholesterol Report - Aug 2024'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to detailed report
              },
            ),
            ListTile(
              leading: Icon(Icons.report, color: Colors.teal),
              title: Text('Blood Pressure Report - Sep 2024'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to detailed report
              },
            ),
          ],
        ),
      ),
    );
  }
}

class HealthData {
  final String date;
  final int value;

  HealthData(this.date, this.value);
}
