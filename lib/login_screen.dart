import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart' // new
    hide EmailAuthProvider, PhoneAuthProvider;    // new
import 'package:provider/provider.dart';          // new

import 'app_state.dart';                          // new
import 'pages/authentication.dart';

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
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Container(
                 height: 400, 
                 width: double.infinity,
                 color: const Color.fromARGB(199, 237, 241, 214),
                 child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text('Login',
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),
                      ),
                    ),
                    // ElevatedButton(
                    //   onPressed: dummy,
                    //   child: Text('Sign In with Google',
                    //   style: GoogleFonts.raleway(
                    //     fontWeight: FontWeight.w500,
                    //     fontSize: 25,
                    //   ),
                    //   )
                    //   ),
                      Consumer<ApplicationState>(
                        builder: (context, appState, _) => AuthFunc(
                            loggedIn: appState.loggedIn,
                            signOut: () {
                              FirebaseAuth.instance.signOut();
                            }),
                      ),
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