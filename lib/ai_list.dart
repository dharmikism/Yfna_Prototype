import 'package:flutter/material.dart';
import 'temp_store.dart';
import 'login.dart';

class AIList extends StatelessWidget {
  AIList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Supra.ai – AI Module'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => LoginScreen()),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: TempStore.complaints.length,
        itemBuilder: (context, index) {
          final c = TempStore.complaints[index];
          return ListTile(
            title: Text('Complaint #${index + 1}'),
            subtitle: Text(c.status),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AnalyzeScreen(complaint: c),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class AnalyzeScreen extends StatefulWidget {
  final Complaint complaint;
  AnalyzeScreen({required this.complaint});

  @override
  State<AnalyzeScreen> createState() => _AnalyzeScreenState();
}

class _AnalyzeScreenState extends State<AnalyzeScreen> {
  String? problem;
  String? department;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AI Analysis')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.memory(widget.complaint.image, height: 200),
            const SizedBox(height: 20),

            DropdownButtonFormField(
              hint: const Text('Select Problem'),
              items: const [
                DropdownMenuItem(value: 'Electrical', child: Text('Electrical')),
                DropdownMenuItem(value: 'Water', child: Text('Water')),
                DropdownMenuItem(value: 'Infrastructure', child: Text('Infrastructure')),
                DropdownMenuItem(value: 'Cleanliness', child: Text('Cleanliness')),
              ],
              onChanged: (v) => problem = v,
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField(
              hint: const Text('Select Department'),
              items: const [
                DropdownMenuItem(value: 'Maintenance', child: Text('Maintenance')),
                DropdownMenuItem(value: 'Admin', child: Text('Admin')),
                DropdownMenuItem(value: 'IT', child: Text('IT')),
              ],
              onChanged: (v) => department = v,
            ),

            const SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                widget.complaint.problem = problem;
                widget.complaint.department = department;
                widget.complaint.status = 'Analyzed';
                Navigator.pop(context);
              },
              child: const Text('Send AI Result'),
            )
          ],
        ),
      ),
    );
  }
}
