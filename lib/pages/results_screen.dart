import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final Map results;
  const ResultScreen({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
      child: Column(
        children: [
          const Text('Results'),
          ...results.entries
              .map(
                (entry) => Card(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(entry.key), // Convert key to Text widget
                        leading: Text(entry.value
                            .toString()), // Convert value to Text widget
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () => {},
                            child: const Text("Remedies"),
                          ),
                          const SizedBox(
                            width: 8,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
              .toList()
        ],
      ),
    ));
  }
}
