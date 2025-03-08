import 'package:donow/data/database.dart';
import 'package:flutter/material.dart';
import "package:hive_flutter/hive_flutter.dart";
import "package:donow/data/database.dart";
import 'package:donow/util/dialog_box.dart';
import 'package:donow/util/todo_tile.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  final _tasksBox = Hive.box("tasks");
  TodoDB db = TodoDB();
  
  @override
  void initState() {
    if (_tasksBox.get("TODOLIST") == null) {
      db.createInitTasks();
    } else {
      db.loadTasks();
    }
    super.initState();
  }

  final _controller = TextEditingController();
  
  void _checkBoxChanged(bool? value, int index) {
    setState(() {
      db.todoTasksList[index][1] = !db.todoTasksList[index][1];
    });
    db.updateTasks();
  }

  void _saveNewTask() {
    setState(() {
      db.todoTasksList.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateTasks();
    Navigator.of(context).pop();
  }

  void _createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          handleSave: _saveNewTask,
          handleCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  void _deleteTask(int index) {
    setState(() {
      db.todoTasksList.removeAt(index);
    });
    db.updateTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("To Do"),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
          itemCount: db.todoTasksList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: db.todoTasksList[index][0],
              isTaskCompleted: db.todoTasksList[index][1],
              handleOnChanged: (value) => _checkBoxChanged(value, index),
              deleteFunction: (context) => _deleteTask(index),
            );
          }),
    );
  }
}
