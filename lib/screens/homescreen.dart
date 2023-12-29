import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_application/screens/add_task_screen.dart';

import 'package:note_application/data/task.dart';
import 'package:note_application/widgets/task_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputText = '';
  var controler = TextEditingController();
  var box = Hive.box('names');
  var taskbox = Hive.box<Task>('taskbox');
  bool isFabVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      body: Center(
        child: ValueListenableBuilder(
          valueListenable: taskbox.listenable(),
          builder: (context, value, child) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notif) {
                setState(() {
                  if (notif.direction == ScrollDirection.forward) {
                    isFabVisible = true;
                  }
                  if (notif.direction == ScrollDirection.reverse) {
                    isFabVisible = false;
                  }
                });
                return true;
              },
              child: ListView.builder(
                itemCount: taskbox.values.length,
                itemBuilder: ((context, index) {
                  var task = taskbox.values.toList()[index];
                  return getListItem(task);
                }),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Visibility(
        visible: isFabVisible,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddTaskScreen(),
              ),
            );
          },
          backgroundColor: Color(0xff18DAA3),
          child: Image.asset('images/icon_add.png'),
        ),
      ),
    );
  }

  Widget getListItem(Task task) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        task.delete();
      },
      key: UniqueKey(),
      child: TaskWidget(task: task),
    );
  }
}
