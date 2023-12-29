import 'package:note_application/data/type_enum.dart';
import 'package:note_application/data/task_type.dart';

List<Tasktype> getTaskTypeList() {
  var list = [
    Tasktype(
        image: 'images/meditate.png',
        title: 'تمرکز',
        TasktypeEnum: TaskTypeEnum.foucs),
    Tasktype(
        image: 'images/social_frends.png',
        title: 'دیدار',
        TasktypeEnum: TaskTypeEnum.date),
    Tasktype(
        image: 'images/hard_working.png',
        title: 'کار کردن',
        TasktypeEnum: TaskTypeEnum.working),
    Tasktype(
        image: 'images/workout.png',
        title: 'ورزش',
        TasktypeEnum: TaskTypeEnum.working),
    Tasktype(
        image: 'images/work_meeting.png',
        title: 'جلسه',
        TasktypeEnum: TaskTypeEnum.date),
    Tasktype(
        image: 'images/banking.png',
        title: 'کار بانکی',
        TasktypeEnum: TaskTypeEnum.working),
  ];

  return list;
}
