import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Topnav extends StatefulWidget {
  const Topnav({super.key});

  @override
  State<Topnav> createState() => _TopnavState();
}

class _TopnavState extends State<Topnav> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> items = [
    {"icon": FontAwesomeIcons.list, "label": "Category"},
    {"icon": FontAwesomeIcons.mobileScreen, "label": "Mobiles"},
    {"icon": FontAwesomeIcons.tag, "label": "Offers"},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(10),
        ),
        height: 70,
        width: double.infinity,
        // color: Colors.purple,
        child: Row(
          children: List.generate(items.length, (index) {
            final isSelected = index == selectedIndex;
      
            return Expanded(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  color: isSelected
                      ? const Color.fromARGB(255, 5, 67, 238).withOpacity(0.25)
                      : Colors.transparent,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        items[index]['icon'],
                        size: 20,
                        color:
                            isSelected ? Colors.white : Colors.white70,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        items[index]['label'],
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: isSelected
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color:
                              isSelected ? Colors.white : Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}