import 'package:flutter/material.dart';
import 'package:shopit/consta/constant.dart';
import 'package:shopit/routes/routes.dart';
import 'package:shopit/widgets/textfeild.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(child: Image.asset(bg, fit: BoxFit.cover)),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "ShopIT",
                          style: GoogleFonts.bungee(fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  Container(
                    height: 500,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            "Welcome back",
                            style: GoogleFonts.roboto(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Textfeild(
                            hint: 'Enter Your E-mail',
                            icon: Icon(Icons.email),
                            obsecuretext: false,
                          ),
                          const SizedBox(height: 30),
                          const Textfeild(
                            hint: 'Enter Your Password',
                            icon: Icon(Icons.lock),
                            obsecuretext: true,
                          ),
                          SizedBox(height: 20),
                          InkWell(
                            onTap: () => Navigator.pushNamed(
                              context,
                              Approutes.homescreen,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    const Color.fromARGB(255, 96, 105, 208),
                                    const Color.fromARGB(255, 0, 25, 189),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              height: 40,
                              width: 200,
                              child: Center(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () => Navigator.pushNamed(
                                  context,
                                  Approutes.signup,
                                ),
                                child: Center(
                                  child: Text(
                                    "Already regitered?",
                                    style: GoogleFonts.poppins(
                                      color: Colors.blue,
                                      fontSize: 13,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 17),
                              Container(
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color.fromARGB(255, 200, 102, 209),
                                      const Color.fromARGB(206, 127, 22, 198),
                                    ],
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(google, height: 42),
                                    Image.asset(facebook, height: 42),
                                    Image.asset(phone, height: 42),
                                  ],
                                ),
                              ),
                              //
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
