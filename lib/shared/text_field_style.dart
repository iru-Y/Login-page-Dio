import 'package:flutter/material.dart';

class TextFieldStyle extends StatelessWidget {
  TextEditingController textController = TextEditingController();
  TextFieldStyle({Key? key, required this.textController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
      style: const TextStyle(
        color: Colors.black
      ),
    );
  }
}
