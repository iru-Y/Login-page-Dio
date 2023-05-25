import 'package:flutter/material.dart';

class TextLabel extends StatelessWidget {
  final String text;
  const TextLabel({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.05),
      child: Text(text,
        style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black),
      ),
    );
  }
}
