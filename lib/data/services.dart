import 'package:dio/dio.dart';
import 'package:iti_flutter_intern/models/todo_model.dart';

class TaskService {
  String path = "https://jsonplaceholder.typicode.com/todos";

  Future<List<TaskModel>> fetchData() async {
    List<TaskModel> tasks = [];
    Response response = await Dio().get(path);
    var data = response.data;
    data.forEach((element) {
      TaskModel task = TaskModel.fromJson(element);
      tasks.add(task);
    });
    return tasks;
  }
}
