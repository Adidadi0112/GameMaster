import 'package:flutter/material.dart';
import 'package:game_master_app/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game Master',
      theme: ThemeData(
        colorScheme: const ColorScheme(
            background: Color.fromARGB(255, 107, 138, 122),
            brightness: Brightness.dark,
            primary: Color.fromARGB(255, 37, 67, 54),
            secondary: Color.fromARGB(255, 37, 67, 54),
            onPrimary: Color.fromARGB(255, 37, 67, 54),
            onSecondary: Color.fromARGB(255, 37, 67, 54),
            onError: Color.fromARGB(255, 37, 67, 54),
            onBackground: Color.fromARGB(255, 37, 67, 54),
            onSurface: Color.fromARGB(255, 37, 67, 54),
            surface: Color.fromARGB(255, 107, 138, 122),
            error: Color.fromARGB(255, 37, 67, 54)),
        useMaterial3: true,
         textTheme: GoogleFonts.latoTextTheme(
           Theme.of(context).textTheme,
         ),
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}
