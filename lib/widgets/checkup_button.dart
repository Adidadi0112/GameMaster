import 'package:flutter/material.dart';

class CheckupButton extends StatefulWidget {
  const CheckupButton ({Key? key, required this.route, required this.text}) : super(key: key);
  final VoidCallback route;
  final String text;

  @override
  State<CheckupButton> createState() => _CheckupButton();

}

class _CheckupButton extends State<CheckupButton> {
  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: widget.route,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          fixedSize: const Size(350, 35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20)
          )
        ),
        child: Text(
          widget.text,
          style: const TextStyle(
              color: Colors.white,
          ),
        ),
    );
  }
}