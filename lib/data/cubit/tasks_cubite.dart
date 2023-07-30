import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter_intern/data/services.dart';
import 'package:iti_flutter_intern/data/state/tasks_state.dart';
import 'package:iti_flutter_intern/models/todo_model.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitState()) {
    getTasks();
  }
  List<TaskModel> tasks = [];

  getTasks() async {
    try {
      emit(TasksLoadingState());
      tasks = await TaskService().fetchData();
      emit(TasksSuccessState());
    } catch (e) {
      print(e.toString());
      emit(TasksErrState());
    }
  }
}
