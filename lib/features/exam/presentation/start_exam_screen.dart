
import 'package:flutter/material.dart';
import 'package:online_exam/core/routes/app_routes.dart';
import 'package:online_exam/core/utils/extension/navigations.dart';

class StartExamScreen extends StatelessWidget {
  const StartExamScreen({super.key, required this.examId});
  final String examId;

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Exam Header with Icon, Title, Level, Questions, and Duration
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Exam Icon
                Image.network(
                  'https://example.com/icon.png', // Replace with your image URL or AssetImage if using local assets
                  width: 48,
                  height: 48,
                ),
                const SizedBox(width: 8),
                // Exam Title, Level, and Questions
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Languages',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: const [
                          Text(
                            'High level',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            ' | ',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                          Text(
                            '20 Questions',
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Exam Duration
                const Text(
                  '30 Minutes',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Instructions Section
            const Text(
              'Instructions',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            // Instructions List
            const Text(
              '• Lorem ipsum dolor sit amet consectetur.\n'
                  '• Lorem ipsum dolor sit amet consectetur.\n'
                  '• Lorem ipsum dolor sit amet consectetur.\n'
                  '• Lorem ipsum dolor sit amet consectetur.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const Spacer(),

            // Start Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.pushNamed(AppRoutes.questions, arguments: examId);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'Start',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}