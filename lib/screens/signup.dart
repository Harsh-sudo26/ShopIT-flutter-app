import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopit/consta/constant.dart';
import 'package:shopit/routes/routes.dart';
import 'package:shopit/widgets/textfeild.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(bg),
            fit: BoxFit.cover, // ✅ FULL SCREEN COVER
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  /// 🔵 LOGO CONTAINER
                  Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                    child: Center(
                      child: Text(
                        "ShopIT",
                        style: GoogleFonts.bungee(fontSize: 30),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  /// 🟣 SIGNUP CARD
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min, // ✅ important
                        children: [

                          Text(
                            "Create Account",
                            style: GoogleFonts.roboto(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          const SizedBox(height: 20),

                          const Textfeild(
                            hint: 'Enter Your Name',
                            icon: Icon(Icons.person),
                            obsecuretext: false,
                          ),

                          const SizedBox(height: 15),

                          const Textfeild(
                            hint: 'Enter Your E-mail',
                            icon: Icon(Icons.email),
                            obsecuretext: false,
                          ),

                          const SizedBox(height: 15),

                          const Textfeild(
                            hint: 'Enter Your Password',
                            icon: Icon(Icons.lock),
                            obsecuretext: true,
                          ),

                          const SizedBox(height: 15),

                          const Textfeild(
                            hint: 'Confirm Password',
                            icon: Icon(Icons.lock_outline),
                            obsecuretext: true,
                          ),

                          const SizedBox(height: 25),

                          /// 🔵 SIGN UP BUTTON
                          SizedBox(
                            width: 200,
                            height: 45,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 0, 25, 189),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Approutes.homescreen);
                              },
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(height: 15),

                          /// 🔵 LOGIN TEXT
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Approutes.login);
                            },
                            child: Text(
                              "Already have an account? Login",
                              style: GoogleFonts.poppins(
                                color: Colors.blue,
                                fontSize: 13,
                              ),
                            ),
                          ),

                          const SizedBox(height: 20),

                          /// 🟣 SOCIAL LOGIN CONTAINER
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: const LinearGradient(
                                colors: [
                                  Color.fromARGB(255, 200, 102, 209),
                                  Color.fromARGB(206, 127, 22, 198),
                                ],
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Image.asset(google, height: 35),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Image.asset(facebook, height: 35),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Image.asset(phone, height: 35),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
