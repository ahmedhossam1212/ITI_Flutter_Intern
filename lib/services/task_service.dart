import 'package:dio/dio.dart';
import 'package:iti_flutter_intern/models/todo_model.dart';

class TasksService {
  List<TaskModel> list = [];
  String url = "https://jsonplaceholder.typicode.com/todos";
  Future<List<TaskModel>> getData() async {
    var response = await Dio().get(url);
    var data = response.data;
    data.forEach((element) {
      TaskModel task = TaskModel.fromJson(element);
      list.add(task);
    });
    return list;
  }
}
