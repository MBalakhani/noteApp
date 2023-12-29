import 'package:hive_flutter/hive_flutter.dart';
import 'package:note_application/data/task_type.dart';
part 'task.g.dart';

@HiveType(typeId: 1)
class Task extends HiveObject {
  Task({
    required this.title,
    required this.subtitle,
    this.IsDone = false,
    required this.time,
    required this.tasktype,
  });
  @HiveField(0)
  String title;
  @HiveField(1)
  String subtitle;
  @HiveField(2)
  bool IsDone;
  @HiveField(3)
  DateTime time;
  @HiveField(4)
  Tasktype tasktype;
}
