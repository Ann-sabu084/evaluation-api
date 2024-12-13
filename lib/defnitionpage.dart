import 'package:flutter/material.dart';

class DefinitionPage extends StatelessWidget {
  final String definition;
  final String partOfSpeech;

  const DefinitionPage({
    super.key,
    required this.definition,
    required this.partOfSpeech,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Definition"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Word Definition:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'Part of Speech: $partOfSpeech',
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 10),
              Text(
                definition,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
