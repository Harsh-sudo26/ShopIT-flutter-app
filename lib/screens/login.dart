import 'package:flutter/material.dart';
import 'package:shopit/consta/constant.dart';
import 'package:shopit/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  Login({super.key});
  
 
  @override
  State<Login> createState() => _LoginState();
   bool _obscureText = true;
   final _formKey = GlobalKey<FormState>();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(color: Color.fromARGB(149, 255, 235, 59)),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
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
                      color: Color.fromARGB(255, 255, 255, 255),
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
                          Form(
                            key: widget._formKey,
                            child: Column(
                              children: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                    ),
                                    hintText: "Enter Email",
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter email';
                                    }
                                    if (!value.contains('@')) {
                                      return 'Enter valid email';
                                    }
                                    return null;
                                  },
                                ),

                                const SizedBox(height: 25),

                                TextFormField(
                                  obscureText: widget._obscureText,
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(30),
                                      ),
                                    ),
                                    hintText: "Enter Password",
                                    suffixIcon: IconButton(
                                      onPressed: () {
                                        setState(() {
                                          widget._obscureText = !widget._obscureText;
                                        });
                                      },
                                      icon: Icon(
                                        widget._obscureText
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                      ),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter password';
                                    }
                                    if (value.length < 6) {
                                      return 'Password must be at least 6 characters';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),

                          SizedBox(height: 20),
                          InkWell(
                            onTap: () {
                              if (widget._formKey.currentState!.validate()) {
                                Navigator.pushNamed(
                                  context,
                                  Approutes.homescreen,
                                );
                              }
                            },
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
