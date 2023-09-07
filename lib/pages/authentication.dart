// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prac/login_page.dart';
import 'widgets.dart';

class AuthFunc extends StatelessWidget {
  const AuthFunc({
    super.key,
    required this.loggedIn,
    required this.signOut,
  });

  final bool loggedIn;
  final void Function() signOut;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding:
                const EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 8),
            child: ElevatedButton(
                onPressed: () {
                  !loggedIn ? context.push('/sign-in') : signOut();
                },
                child: Text(
                  'Sign In',
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w500,
                    fontSize: 25,
                  ),
                ))
            // child: StyledButton(
            //     onPressed: () {
            //       !loggedIn ? context.push('/sign-in') : signOut();
            //     },
            //     child: !loggedIn ? const Text('RSVP') : const Text('Logout')),
            ),
        Visibility(
          visible: !loggedIn,
          // child: const HomePage(),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 30, right: 24, top: 24, bottom: 8),
            child: StyledButton(
                onPressed: () {
                  context.push('/home');
                },
                child: const Text('Go to Home')),
          ),
        ),
      ],
    );
  }
}
