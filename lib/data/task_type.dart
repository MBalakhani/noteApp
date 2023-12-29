import 'package:hive_flutter/adapters.dart';
import 'package:note_application/data/type_enum.dart';
part 'task_type.g.dart';

@HiveType(typeId: 2)
class Tasktype {
  Tasktype({
    required this.image,
    required this.title,
    required this.TasktypeEnum,
  });
  @HiveField(0)
  String image;
  @HiveField(1)
  String title;
  @HiveField(2)
  TaskTypeEnum TasktypeEnum;
}
