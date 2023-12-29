import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'package:note_application/data/task.dart';
import 'package:note_application/widgets/task_type_itemlist.dart';

import 'package:note_application/utility/utility.dart';
import 'package:time_pickerr/time_pickerr.dart';

class EditTaskScreen extends StatefulWidget {
  EditTaskScreen({super.key, required this.task});
  Task task;

  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  FocusNode negahban1 = FocusNode();
  FocusNode negahban2 = FocusNode();
  TextEditingController? controllerTaskTitle;
  TextEditingController? controllerTaskSubTitle;
  var box = Hive.box<Task>('taskbox');
  DateTime _time = DateTime.now();
  int _selectedTasktypeItem = 0;

  @override
  void initState() {
    super.initState();
    controllerTaskTitle = TextEditingController(text: widget.task.title);
    controllerTaskSubTitle = TextEditingController(text: widget.task.subtitle);

    negahban1.addListener(() {
      setState(() {});
    });
    negahban2.addListener(() {
      setState(() {});
    });
    var index = getTaskTypeList().indexWhere((element) {
      return element.image == widget.task.tasktype.image;
    });
    _selectedTasktypeItem = index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44.0),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      controller: controllerTaskTitle,
                      focusNode: negahban1,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        labelText: 'عنوان',
                        labelStyle: TextStyle(
                          fontSize: 16,
                          color: negahban1.hasFocus
                              ? Color(0xff18DAA3)
                              : Color(0xffC5C5C5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(color: Color(0xffC5C5C5), width: 3.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            width: 3,
                            color: Color(0xff18DAA3),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 44.0),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: TextField(
                      controller: controllerTaskSubTitle,
                      maxLines: 2,
                      focusNode: negahban2,
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        labelText: 'توضیحات',
                        labelStyle: TextStyle(
                          fontSize: 16,
                          color: negahban2.hasFocus
                              ? Color(0xff18DAA3)
                              : Color(0xffC5C5C5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide:
                              BorderSide(color: Color(0xffC5C5C5), width: 3.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          borderSide: BorderSide(
                            width: 3,
                            color: Color(0xff18DAA3),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: CustomHourPicker(
                    title: 'انتخاب زمان برنامه',
                    titleStyle: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    negativeButtonText: 'لغو',
                    negativeButtonStyle: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                    positiveButtonText: 'انتخاب',
                    positiveButtonStyle: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                    onNegativePressed: (context) {},
                    onPositivePressed: (context, time) {
                      _time = time;
                    },
                    elevation: 3,
                  ),
                ),
                Container(
                  height: 180,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: getTaskTypeList().length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            _selectedTasktypeItem = index;
                          });
                        },
                        child: TaskTypeItemList(
                          tasktype: getTaskTypeList()[index],
                          index: index,
                          selectedItemList: _selectedTasktypeItem,
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200, 48),
                    primary: Color(0xff18DAA3),
                  ),
                  onPressed: () {
                    String tasktitle = controllerTaskTitle!.text;
                    String tasksubtitle = controllerTaskSubTitle!.text;
                    EditTask(tasktitle, tasksubtitle);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'ذخیره ویرایش',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  EditTask(String tasktitle, String tasksubtitle) {
    widget.task.title = tasktitle;
    widget.task.subtitle = tasksubtitle;
    widget.task.time = _time;
    widget.task.tasktype = getTaskTypeList()[_selectedTasktypeItem];
    widget.task.save();
  }
}
