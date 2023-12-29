import 'package:flutter/material.dart';
import 'package:note_application/data/task_type.dart';

class TaskTypeItemList extends StatelessWidget {
  TaskTypeItemList({
    super.key,
    required this.tasktype,
    required this.index,
    required this.selectedItemList,
  });
  Tasktype tasktype;
  int index;
  int selectedItemList;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color:
                (selectedItemList == index) ? Colors.green : Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.all(Radius.circular(15))),
      margin: EdgeInsets.all(8),
      width: 130,
      child: Column(
        children: [
          Image.asset(tasktype.image),
          Text(
            tasktype.title,
            style: TextStyle(
              fontSize: (selectedItemList == index) ? 18 : 15,
            ),
          ),
        ],
      ),
    );
  }
}
