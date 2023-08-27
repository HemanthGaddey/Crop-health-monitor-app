import 'package:flutter/material.dart';
// import 'package:prac/login_page.dart';
import 'package:prac/pages/home_screen.dart';
import 'package:prac/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'app_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_ui_auth/src/providers/email_auth_provider.dart'
    as email_auth;
import './pages/home_screen.dart';

void main() async {
  // runApp(const MainApp());
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([email_auth.EmailAuthProvider()]);

  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: ((context, child) => const App()),
  ));
}
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Login(),
      routes: [
        GoRoute(
          path: 'sign-in',
          builder: (context, state) {
            return SignInScreen(
              actions: [
                ForgotPasswordAction(((context, email) {
                  final uri = Uri(
                    path: '/sign-in/forgot-password',
                    queryParameters: <String, String?>{
                      'email': email,
                    },
                  );
                  context.push(uri.toString());
                })),
                AuthStateChangeAction(((context, state) {
                  if (state is SignedIn || state is UserCreated) {
                    var user = (state is SignedIn)
                        ? state.user
                        : (state as UserCreated).credential.user;
                    if (user == null) {
                      return;
                    }
                    if (state is UserCreated) {
                      user.updateDisplayName(user.email!.split('@')[0]);
                    }
                    if (!user.emailVerified) {
                      user.sendEmailVerification();
                      const snackBar = SnackBar(
                          content: Text(
                              'Please check your email to verify your email address'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    context.pushReplacement('/');
                  }
                })),
              ],
            );
          },
          // routes: [
          //   GoRoute(
          //     path: 'forgot-password',
          //     builder: (context, state) {
          //       final arguments = state.queryParameters;
          //       return ForgotPasswordScreen(
          //         email: arguments['email'],
          //         headerMaxExtent: 200,
          //       );
          //     },
          //   ),
          // ],
        ),
        GoRoute(
          path: 'home',
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          path: 'profile',
          builder: (context, state) {
            return ProfileScreen(
              providers: const [],
              actions: [
                SignedOutAction((context) {
                  context.pushReplacement('/');
                }),
              ],
            );
          },
        ),
      ],
    ),
  ],
);
// final _router = GoRouter(
//   routes: [
//     GoRoute(
//       path: '/',
//       builder: (context, state) => const Login(),
//       routes: [
//         GoRoute(
//           path: 'sign-in',
//           builder: (context, state) {
//             return Scaffold(
//               body: const Text('its working'),
//             );
//             // return SignInScreen(
//             //   actions: [
//             //     ForgotPasswordAction(((context, email) {
//             //       final uri = Uri(
//             //         path: '/sign-in/forgot-password',
//             //         queryParameters: <String, String?>{
//             //           'email': email,
//             //         },
//             //       );
//             //       context.push(uri.toString());
//             //     })),
//             //     AuthStateChangeAction(((context, state) {
//             //       final user = switch (state) {
//             //         SignedIn state => state.user,
//             //         UserCreated state => state.credential.user,
//             //         _ => null
//             //       };
//             //       if (user == null) {
//             //         return;
//             //       }
//             //       if (state is UserCreated) {
//             //         user.updateDisplayName(user.email!.split('@')[0]);
//             //       }
//             //       if (!user.emailVerified) {
//             //         user.sendEmailVerification();
//             //         const snackBar = SnackBar(
//             //             content: Text(
//             //                 'Please check your email to verify your email address'));
//             //         ScaffoldMessenger.of(context).showSnackBar(snackBar);
//             //       }
//             //       context.pushReplacement('/');
//             //     })),
//             //   ],
//             // );
//           },
//           // routes: [
//           //   GoRoute(
//           //     path: 'forgot-password',
//           //     builder: (context, state) {
//           //       final arguments = state.extra;
//           //       return ForgotPasswordScreen(
//           //         email: arguments!['email'],
//           //         headerMaxExtent: 200,
//           //       );
//           //     },
//           //   ),
//           // ],
//         ),
//         GoRoute(
//           path: 'profile',
//           builder: (context, state) {
//             return ProfileScreen(
//               providers: const [],
//               actions: [
//                 SignedOutAction((context) {
//                   context.pushReplacement('/');
//                 }),
//               ],
//             );
//           },
//         ),
//       ],
//     ),
//   ],
// );

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Firebase Application',
      theme: ThemeData(
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.deepPurple,
            ),
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      routerConfig: _router, // new
    );
  }
}

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'practise',
//       theme: ThemeData(),
//       routes: {
//         '/login': (context) => const Login(),
//         '/home': (context) => const HomeScreen(),
//       },
//       home: const Login(),
//       );
//   }
// }
