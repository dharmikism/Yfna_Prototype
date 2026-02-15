import 'package:flutter/material.dart';
import 'reporter_capture.dart';
import 'ai_list.dart';

class ModeSelect extends StatelessWidget {
  const ModeSelect({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Mode')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ReporterCapture()),
                );
              },
              child: const Text('Report Complain'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AIList()),
                );
              },
              child: const Text('Supra.ai'),
            ),
          ],
        ),
      ),
    );
  }
}
