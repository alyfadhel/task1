import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const MyTextButton({required this.onPressed, required this.text, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed();
      },
      child: Text(
        text,
        style: TextStyle(
          color: Colors.teal[500],
          fontSize: 20.0,
        ),
      ),
    );
  }
}
