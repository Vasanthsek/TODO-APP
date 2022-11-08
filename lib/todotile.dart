import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


class ToDoTile extends StatelessWidget {
 
  final String taskName;
  final bool isCOmpleted;
 Function(bool?)? onChanged;
 Function(BuildContext)? deleteFunction;


  ToDoTile({
    super.key,
    required this.taskName,
   required this.isCOmpleted,
    required this.onChanged,
    required this.deleteFunction,
   
    
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25, top: 25),
      child: Slidable(
        
        endActionPane: ActionPane(motion:const StretchMotion(), children:[ SlidableAction(backgroundColor: Colors.red.shade300, onPressed: deleteFunction,icon: Icons.delete,borderRadius: BorderRadius.circular(12),)]),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: ListTile(
            
            leading: Checkbox(
                value: isCOmpleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              title: Text(
                taskName,
                style:  TextStyle(
                  decoration: isCOmpleted? TextDecoration.lineThrough:
                      TextDecoration.none
                ),
              ),
            
          ),
        ),
      ),
    );
  }
}