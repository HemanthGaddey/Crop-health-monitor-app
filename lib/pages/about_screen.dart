import 'package:flutter/material.dart';
import 'dart:io';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About")),
      backgroundColor: Color.fromARGB(255, 86, 133, 94),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Text(
                'Crop Health Monitor is a project made',
                style: TextStyle(
                  fontSize: 23.0,
                  color: Color.fromARGB(255, 229, 220, 165),
                ),
              ),
              Text(
                'under Prof. Nitin Khanna,',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Color.fromARGB(255, 229, 220, 165),
                ),
              ),
              Text(
                'by A. Chaitanya Sai',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Color.fromARGB(255, 229, 220, 165),
                ),
              ),
              Text(
                'and',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Color.fromARGB(255, 229, 220, 165),
                ),
              ),
              Text(
                'G. Hemanth Chowdary',
                style: TextStyle(
                  fontSize: 25.0,
                  color: Color.fromARGB(255, 229, 220, 165),
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () => {
                  //do something
                },
                child: SizedBox(
                  width: 110,
                  child: Row(
                    children: [
                      Text('Visit Website  '),
                      Icon(Icons.open_in_browser),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
