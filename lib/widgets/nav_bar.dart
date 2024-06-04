import 'package:flutter/material.dart';
import '../screens/home.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  _NavBar createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  @override
  Widget build(context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(15),
          child: Align(
            alignment: Alignment(0.0, 1.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Color.fromARGB(255, 37, 67, 54),
                selectedItemColor: Color(0xFFC4DAE6),
                unselectedItemColor: Color(0xFFEDEDF1),
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.question_mark),
                    label: "Pomoc",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: "Strona Główna",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.dining),
                    label: "Kuchnia BR",
                  ),
                ],
                onTap: (index) {
                  // Obsługa przekierowania na podstawie indeksu
                  if (index == 0) {
                    print("Przekierowanie do strony głównej");
                  } else if (index == 1) {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const HomeScreen(),
                      ),
                    );
                  } else if (index == 2) {
                    
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}