import 'package:flutter/material.dart';
import 'package:iti_flutter_intern/models/todo_model.dart';
import 'package:iti_flutter_intern/services/task_service.dart';

class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  List<TaskModel> tasks = [];
  bool isloading = true;
  Future<void> fetchTasks() async {
    tasks = await TasksService().getData();
    isloading = false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isloading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: tasks.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("${tasks[index].title}"),
              ),
            ),
    );
  }
}
