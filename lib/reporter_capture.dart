import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'temp_store.dart';
import 'login.dart';

class ReporterCapture extends StatefulWidget {
  ReporterCapture({super.key});

  @override
  State<ReporterCapture> createState() => _ReporterCaptureState();
}

class _ReporterCaptureState extends State<ReporterCapture> {
  Uint8List? imageBytes;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      final bytes = await file.readAsBytes();
      setState(() {
        imageBytes = bytes;
      });
    }
  }

  void submit() {
    TempStore.complaints.add(
      Complaint(image: imageBytes!),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final lastComplaint = TempStore.complaints.isNotEmpty
        ? TempStore.complaints.last
        : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Issue Reporter'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (lastComplaint != null) ...[
              const Text(
                'Last Complaint Status',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text('Status: ${lastComplaint.status}'),
              if (lastComplaint.problem != null)
                Text('Problem: ${lastComplaint.problem}'),
              if (lastComplaint.department != null)
                Text('Department: ${lastComplaint.department}'),
              const SizedBox(height: 30),
            ],

            ElevatedButton(
              onPressed: pickImage,
              child: const Text('Pick Image'),
            ),
            const SizedBox(height: 20),
            if (imageBytes != null)
              Image.memory(imageBytes!, height: 250),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: imageBytes == null ? null : submit,
              child: const Text('Submit Complaint'),
            ),
          ],
        ),
      ),
    );
  }
}
