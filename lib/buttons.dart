// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  final String text;
  final VoidCallback Functionn;
  
  const Buttons({Key? key, required this.text, required this.Functionn, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      onPressed: Functionn,
      child: Text(text));
  }
}