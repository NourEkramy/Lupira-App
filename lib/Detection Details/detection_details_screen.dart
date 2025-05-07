import 'package:flutter/material.dart';

import '../Detection/detection_api.dart';

class DetectionDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> detectionData;

  const DetectionDetailsScreen({super.key, required this.detectionData});

  @override
  State<DetectionDetailsScreen> createState() => _DetectionDetailsScreenState();
}

class _DetectionDetailsScreenState extends State<DetectionDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final responses = widget.detectionData['responses'] as List? ?? [];
    final resultLabel =
        widget.detectionData['resultLabel'] as String? ?? 'No result';

    return Column(
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Icon(
                  Icons.assignment,
                  color: Color(0xFF744199),
                  size: 28,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    overflow: TextOverflow.visible,
                    'Result: $resultLabel',
                    style: TextStyle(
                      fontSize: 22,
                      color: Color(0xFF3D1A57),
                      fontFamily: 'Inder',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: responses.length,
            itemBuilder: (context, index) {
              final item = responses[index] as Map<String, dynamic>;
              return Padding(
                padding: EdgeInsets.only(
                  right: 15,
                  left: 18,
                  top: 5,
                  bottom: 5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['question']?.toString() ?? 'Unknown question',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Inder',
                        color: Color(0xFF4B4A4C),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Answer: ${item['answer']?.toString() ?? 'No answer provided'}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF3D1A57),
                        fontFamily: 'Inder',
                      ),
                    ),
                    SizedBox(height: 18),
                    Divider(
                      color: Color(0xFFABABAB),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
