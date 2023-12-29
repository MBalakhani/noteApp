import 'package:flutter/material.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:note_application/screens/edit_task_screen.dart';
import 'package:note_application/data/task.dart';

class TaskWidget extends StatefulWidget {
  TaskWidget({super.key, required this.task});
  Task task;
  @override
  State<TaskWidget> createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
  bool isBoxChecked = false;

  @override
  void initState() {
    super.initState();
    isBoxChecked = widget.task.IsDone;
  }

  @override
  Widget build(BuildContext context) {
    return getTaskitem();
  }

  getTaskitem() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBoxChecked = !isBoxChecked;
          widget.task.IsDone = isBoxChecked;
          widget.task.save();
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        //height: 132,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: getMaincontent(),
        ),
      ),
    );
  }

  getMaincontent() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      checkColor: Colors.white,
                      activeColor: Color(0xff18DAA3),
                      value: isBoxChecked,
                      onChanged: (isChecked) {},
                    ),
                  ),
                ),
                //SizedBox(width: 5),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      widget.task.title,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 2),
                    Container(
                      width: 140,
                      //height: 38,
                      child: Text(
                        widget.task.subtitle,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ],
            ),
            //SizedBox(height: 15),
            getTimeAndEditButton(),
          ],
        ),
        Spacer(),
        Container(
          height: 115,
          width: 115,
          child: Image(
            image: AssetImage(widget.task.tasktype.image),
          ),
        ),
      ],
    );
  }

  Row getTimeAndEditButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 85,
          height: 28,
          decoration: BoxDecoration(
            color: Color(0xff18DAA3),
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
          ),
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 12,
              vertical: 6,
            ),
            child: Row(
              children: [
                Text(
                  '${widget.task.time.hour}:${getMinUndterTen(widget.task.time)}',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: 8),
                Image.asset('images/icon_time.png'),
              ],
            ),
          ),
        ),
        SizedBox(width: 15),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => EditTaskScreen(task: widget.task),
              ),
            );
          },
          child: Container(
            width: 85,
            height: 28,
            decoration: BoxDecoration(
              color: Color(0xffE2F6F1),
              borderRadius: BorderRadius.all(
                Radius.circular(18),
              ),
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 12,
                vertical: 6,
              ),
              child: Row(
                children: [
                  Text(
                    'ویرایش',
                    style: TextStyle(
                      color: Color(0xff18DAA3),
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(width: 8),
                  Image.asset('images/icon_edit.png'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getMinUndterTen(DateTime time) {
    if (time.minute < 10) {
      return '0${time.minute}';
    } else {
      return time.minute.toString();
    }
  }
}
