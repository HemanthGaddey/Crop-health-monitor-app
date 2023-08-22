import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';


class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  void dummy() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Images/Background_.jpg'),
            fit: BoxFit.cover
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: dummy,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(199, 237, 241, 214),
                  foregroundColor: Color.fromARGB(181, 15, 15, 15)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Text('Sign In',
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      )
                      ),
                    ),
                    Text('Hey person !')
                  ],
                ),
                )
            ],
          ),
        ),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       const Text('CHM'),
      //       SizedBox(height: 20,),
      //       Image.asset('Images/mobile_logo.png', height: 80, width: 70, fit: BoxFit.cover,),
      //       Padding(
      //         padding: const EdgeInsets.all(18.0),
      //         child: ElevatedButton(onPressed: dummy,
      //          child: const Text('Analyze', style: TextStyle(fontSize: 17),),
      //          style: ElevatedButton.styleFrom(
      //           backgroundColor: Color.fromARGB(255, 231, 215, 65),
      //           minimumSize: const Size(double.maxFinite, 50),
      //           shape: RoundedRectangleBorder(
      //             borderRadius: BorderRadius.circular(35)
      //           )
      //          ),
      //          ),
      //       )
      //       // FloatingActionButton(
      //       //   onPressed: dummy,
      //       //   child: const Text(
      //       //     'Analyze',
      //       //     style: TextStyle(
      //       //       fontSize: 17,
      //       //       minimumSize),
      //       //     ),
      //       //   ),
      //     ],
      //   ),
      // ),
    );
  }
}