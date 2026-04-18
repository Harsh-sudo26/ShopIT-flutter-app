import 'package:flutter/material.dart';
import 'package:shopit/widget/productcard.dart';
import 'package:shopit/widget/textfieldwidget.dart';

class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController serchhere = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                color: const Color.fromARGB(26, 255, 255, 255),
                height: 80,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(40),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        // IconButton(onPressed: () {}, icon: Icon(Icons.person)),
                        Text(
                          "Merchnat",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.notifications),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Text(
                '''Curated
           Excellence.''',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 29),
              ),

              Textfield(
                icon: Icon(Icons.search_rounded),
                hinttext: 'Search',
                rowtext: '',
                controller: serchhere,
              ),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  "assets/images/image.png",
                  fit: BoxFit.contain,
                ),
              ),
              Productcard(),
            ],
          ),
        ),
      ),
    );
  }
}
