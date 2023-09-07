import 'package:flutter/material.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                  'Crop Health Monitor is a project made under Prof. Nitin Khanna, by A. Chaitanya Sai and G. Hemanth Chowdary'),
              InkWell(
                child: Text('Visit Website'),
                onTap: () => launchUrl('https://www.google.com/'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
