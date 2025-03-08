import 'package:hive_flutter/hive_flutter.dart';

class TodoDB {
  List todoTasksList = [];
  final _tasksBox = Hive.box("tasks");

  void createInitTasks() {
    todoTasksList = [
      ["Exercise for 30 mins.", false],
      ["Practice proof writing for 1hr", false]
    ];
  }

  void loadTasks() {
    todoTasksList = _tasksBox.get("TODOLIST");
  }

  void updateTasks() {
    _tasksBox.put("TODOLIST", todoTasksList);
  }
}
