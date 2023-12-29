import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_application/screens/homescreen.dart';
import 'package:note_application/data/task.dart';
import 'package:note_application/data/type_enum.dart';
import 'package:note_application/data/task_type.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('names');
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(TasktypeAdapter());
  Hive.registerAdapter(TaskTypeEnumAdapter());

  await Hive.openBox<Task>('taskbox');
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'SM',
        textTheme: TextTheme(
          headline4: TextStyle(
            fontFamily: 'GB',
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
