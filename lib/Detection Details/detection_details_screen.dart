import 'package:flutter/material.dart';

import '../Detection/detection_api.dart';

class DetectionDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> detectionData;

  const DetectionDetailsScreen({super.key, required this.detectionData});

  @override
  State<DetectionDetailsScreen> createState() => _DetectionDetailsScreenState();
}

class _DetectionDetailsScreenState extends State<DetectionDetailsScreen> {
  String _getTitleForIndex(int questionIndex) {
    if (questionIndex == 0) return "ANA test presence";
    if (questionIndex == 1) return "Symptoms";
    if (questionIndex == 17) return "Laboratory Tests";
    return '';
  }

  @override
  Widget build(BuildContext context) {
    final responses = widget.detectionData['responses'] as List? ?? [];
    final resultLabel =
        widget.detectionData['resultLabel'] as String? ?? 'No result';
    String? lastTitle;

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
                      fontWeight: FontWeight.bold,
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
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 10,
              bottom: 16,
            ),
            itemCount: responses.length,
            itemBuilder: (context, index) {
              final item = responses[index] as Map<String, dynamic>;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (_getTitleForIndex(index) != '') ...[
                    Padding(
                      padding: EdgeInsets.only(
                        top: 16,
                        bottom: 14,
                      ),
                      child: Text(
                        _getTitleForIndex(index),
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF3D1A57),
                          fontFamily: 'Inder',
                        ),
                      ),
                    ),
                  ],
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 8,
                      bottom: 6,
                      left: 8,
                    ),
                    child: Text(
                      item['question']?.toString() ?? 'Unknown question',
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Inder',
                        color: Color(0xFF4B4A4C),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 6, bottom: 8, left: 14),
                    child: Text(
                      'Answer: ${item['answer']?.toString() ?? 'No answer provided'}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF3D1A57),
                        fontFamily: 'Inder',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Divider(
                    color: Color(0xFFABABAB),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
