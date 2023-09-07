import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import './widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255,229,220,165),
        child: ListView( 
          children: [
            Container(
              height: size.height*0.3,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 86,133,94),
                      borderRadius: BorderRadius.only(
                        // bottomLeft: Radius.circular(36),
                        bottomRight: Radius.circular(36)
                      )
              ),
              child: 
              Expanded(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 16.0),
                    child: Text(
                      'CHM.',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 70,
                              color: Color.fromARGB(255,229,220,165)
                      )
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                height: 40,
              ),
            ),
            Container(
              height: size.height*0.1,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 86,133,94),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(36),
                  bottomRight: Radius.circular(36)
                ) 
              ),
              child: Row(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "User Details",
                          style: GoogleFonts.poppins(
                                color: Color.fromARGB(255, 229,220,165),
                                fontSize: 23,
                                fontWeight: FontWeight.w400
                              ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: FloatingActionButton(
                      onPressed: () {
                        context.push("/profile");
                      },
                      backgroundColor: Color.fromARGB(255, 229,220,165),
                      foregroundColor: Color.fromARGB(255, 86,133,94),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(90.0), // Adjust the radius as needed
                      ),
                      child: Text("Go"),
                                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 86,133,94),
        leading: IconButton(
          onPressed: () => _scaffoldKey.currentState?.openDrawer(), 
          icon: Icon(Icons.menu, color: Color.fromARGB(255, 229,220,165),size: 35,),
          iconSize: 8,
          color: Color.fromARGB(255, 229,220,165),
          ),
        ),
        body: Container(
          child: Column(
            children: [
              TopBody(),
              Flexible(
                  child: Container(
                // color: Colors.brown,
                height: 85,
              )),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      // color: Colors.pink,
                      height: 95,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 86, 133, 94),
                          borderRadius: BorderRadius.only(
                              // bottomLeft: Radius.circular(36),
                              topLeft: Radius.circular(36),
                              bottomLeft: Radius.circular(36))),
                      height: 135,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Text(
                                "Analyze your plant",
                                style: GoogleFonts.poppins(
                                    color: Color.fromARGB(255, 229, 220, 165),
                                    fontSize: 23,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: FloatingActionButton(
                              onPressed: () {
                                context.push('/analyze');
                              },
                              backgroundColor:
                                  Color.fromARGB(255, 229, 220, 165),
                              foregroundColor: Color.fromARGB(255, 86, 133, 94),
                              child: Text("Go"),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Flexible(
                  child: Container(
                height: 55,
              )),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                      // color: Colors.pink,
                      height: 95,
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 86, 133, 94),
                          borderRadius: BorderRadius.only(
                              // bottomLeft: Radius.circular(36),
                              topLeft: Radius.circular(36),
                              topRight: Radius.circular(-36),
                              bottomLeft: Radius.circular(36))),
                      height: 135,
                      child: Row(
                        children: [
                          Flexible(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(32.0),
                              child: Text(
                                "Know more about us",
                                style: GoogleFonts.poppins(
                                    color: Color.fromARGB(255, 229, 220, 165),
                                    fontSize: size.width * 0.048,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: FloatingActionButton(
                              onPressed: () {
                                context.push('/about');
                              },
                              backgroundColor:
                                  Color.fromARGB(255, 229, 220, 165),
                              foregroundColor: Color.fromARGB(255, 86, 133, 94),
                              child: Text("Go"),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              )

              // Column(
              //   children: [
              //     Expanded(
              //       child: Container(
              //         color: Colors.brown,
              //         height: 12,
              //         child: Text("blank space"),
              //       )
              //       ),
              //     Row(
              //       children: [
              //         Container(
              //           color: Colors.pink,
              //           height: 15,
              //           child: Text("Icon"),
              //         ),
              //         Container(
              //           color: Color.fromARGB(255, 86,133,94),
              //           height: 15,
              //           child: Text("Button"),
              //         )
              //       ],
              //     )
              //   ],
              // )
            ],
          ),
        ),
      );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  final radius = 10.0;
  final arcHeight = 50.0;
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height);
    path.arcToPoint(Offset(size.width, size.height - arcHeight),
        radius: Radius.circular(radius));
    path.lineTo(size.width, size.height - arcHeight / 2);
    path.lineTo(0, size.height - arcHeight / 2);
    path.lineTo(0, size.height - arcHeight);
    path.arcToPoint(Offset(0, size.height), radius: Radius.circular(radius));

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
