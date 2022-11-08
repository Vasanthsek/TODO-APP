// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:todo_app/buttons.dart';

class DialogBox extends StatelessWidget {
  final controllerr;
  final VoidCallback OnSave;
  const DialogBox({Key? key,required this.controllerr,required this.OnSave}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[200],
      content: Container(
        height: 150,
        child: Column(
          children: [
             TextField(
              controller: controllerr,
              cursorColor: Colors.black,
              decoration: const InputDecoration(border: OutlineInputBorder(),hintText: "Add task"),
             ),
             const SizedBox(height: 35,),
             Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Buttons(text: "Save", Functionn: OnSave),
                const SizedBox(width: 4,),
                Buttons(text: "Cancel", Functionn: (){Navigator.of(context).pop();}),
              ],
             ),
          ],
        )
      ),
    );
  }
}