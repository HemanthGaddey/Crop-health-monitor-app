import "package:flutter/material.dart";

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return (PageView(
      children: [
        Container(
          child: const Center(
            child: Text("1"),
          ),
        ),
        Container(
          child: const Center(
            child: Text("2"),
          ),
        ),
        Container(
          child: const Center(
            child: Text("3"),
          ),
        ),
      ],
    ));
  }
}
