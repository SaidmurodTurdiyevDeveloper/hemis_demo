import 'package:flutter/material.dart';


class StudentDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        title: Text('Salom, Saidamir'),
        backgroundColor: Colors.indigo,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(child: Text('S')),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          _buildInfoCard('Bugun sizda 15:30 onlayn dars bor!', Icons.access_time),
          SizedBox(height: 16),
          _buildProgressCard(),
          SizedBox(height: 16),
          _buildStatusCard(),
          SizedBox(height: 16),
          _buildTaskCard(),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String text, IconData icon) {
    return Card(
      color: Colors.orangeAccent,
      child: ListTile(
        leading: Icon(icon, size: 36, color: Colors.white),
        title: Text(text, style: TextStyle(color: Colors.white)),
      ),
    );
  }

  Widget _buildProgressCard() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("O'zlashtirish", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            _buildProgress('Ma\'lumotlar tahlili', 0.75),
            _buildProgress('Dasturlash', 0.55),
            _buildProgress('Ekologiya', 0.65),
            _buildProgress('Operatsion tizimlar', 0.37),
          ],
        ),
      ),
    );
  }

  Widget _buildProgress(String subject, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(subject),
        SizedBox(height: 4),
        LinearProgressIndicator(value: value),
        SizedBox(height: 8),
      ],
    );
  }

  Widget _buildStatusCard() {
    return Card(
      child: ListTile(
        title: Text('Semester topshiriqlari statusi'),
        subtitle: Text('8 ta: Tekshirilmogda\n12 ta: Bajarilgan\n14 ta: Bajarilmagan'),
      ),
    );
  }

  Widget _buildTaskCard() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Topshiriqlar", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            _buildTaskItem('Network ustuvorligi masalasi', 'Amaliy ish', '7 kun qoldi'),
            _buildTaskItem('Matritsani tahlil', 'Kurs ishi', '19.04.2025'),
            _buildTaskItem('Ekologiya', '2-Mustaqil ish', '27.04.2025'),
          ],
        ),
      ),
    );
  }

  Widget _buildTaskItem(String title, String type, String deadline) {
    return ListTile(
      title: Text(title),
      subtitle: Text('$type — $deadline'),
      leading: Icon(Icons.task_alt),
    );
  }
}
