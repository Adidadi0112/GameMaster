import 'package:flutter/material.dart';
import 'package:game_master_app/widgets/nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Game Master'),
      ),
      body: Stack(children: [NavBar()],)
    );
  }
}