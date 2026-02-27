import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopit/consta/constant.dart';
import 'package:shopit/screens/login.dart';
import 'package:shopit/screens/signup.dart';
import 'package:shopit/widgets/buttons.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueAccent, Colors.purpleAccent],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: size.height),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: size.height * 0.05),

                    /// Image
                    Image.asset(
                      onboardimg,
                      height: isTablet ? 220 : size.height * 0.18,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),

                    SizedBox(height: size.height * 0.05),

                    /// Title
                    Text(
                      "Everything You Love, Just a Tap Away",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        fontSize: isTablet ? 40 : size.width * 0.07,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(height: size.height * 0.03),

                    /// Subtitle
                    Text(
                      "Shop without limits.\nDiscover handpicked products you'll love.\nDelivered to your door, faster than ever.",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        fontSize: isTablet ? 22 : size.width * 0.045,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                        height: 1.5,
                      ),
                    ),

                    SizedBox(height: size.height * 0.06),

                    /// Buttons
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 222, 213, 223),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Column(
                        children: [
                          BeautifulButton(
                            isLoading: false,
                            text: 'Login',
                            onPressed: () {
                              void navigateWithAnimation(Widget page) {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: const Duration(
                                      milliseconds: 600,
                                    ),
                                    pageBuilder:
                                        (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                        ) => page,
                                    transitionsBuilder:
                                        (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                          child,
                                        ) {
                                          final offsetAnimation =
                                              Tween<Offset>(
                                                begin: const Offset(1.0, 0.0),
                                                end: Offset.zero,
                                              ).animate(
                                                CurvedAnimation(
                                                  parent: animation,
                                                  curve: Curves.easeInOut,
                                                ),
                                              );

                                          return FadeTransition(
                                            opacity: animation,
                                            child: SlideTransition(
                                              position: offsetAnimation,
                                              child: child,
                                            ),
                                          );
                                        },
                                  ),
                                );
                              }

                              navigateWithAnimation(Login());
                            },
                          ),
                          const SizedBox(height: 20),
                          BeautifulButton(
                            isLoading: false,
                            text: 'Sign up',
                            onPressed: () {
                              void navigateWithAnimation(Widget page) {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: const Duration(
                                      milliseconds: 600,
                                    ),
                                    pageBuilder:
                                        (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                        ) => page,
                                    transitionsBuilder:
                                        (
                                          context,
                                          animation,
                                          secondaryAnimation,
                                          child,
                                        ) {
                                          final offsetAnimation =
                                              Tween<Offset>(
                                                begin: const Offset(1.0, 0.0),
                                                end: Offset.zero,
                                              ).animate(
                                                CurvedAnimation(
                                                  parent: animation,
                                                  curve: Curves.easeInOut,
                                                ),
                                              );

                                          return FadeTransition(
                                            opacity: animation,
                                            child: SlideTransition(
                                              position: offsetAnimation,
                                              child: child,
                                            ),
                                          );
                                        },
                                  ),
                                );
                              }

                              navigateWithAnimation(const Signup());
                            },
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: size.height * 0.05),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
