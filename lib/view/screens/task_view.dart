import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter_intern/data/cubit/tasks_cubit/tasks_cubite.dart';
import 'package:iti_flutter_intern/data/state/tasks_state/tasks_state.dart';
import 'package:iti_flutter_intern/view/screens/task_details.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("TASKS"),
        ),
        body: BlocProvider(
          create: (context) => TasksCubit(),
          child: BlocConsumer<TasksCubit, TasksState>(
            listener: (context, state) {
              if (state is TasksLoadingState) {}
            },
            builder: (context, state) {
              return state is TasksLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : state is TasksSuccessState
                      ? ListView.builder(
                          itemCount: context.watch<TasksCubit>().tasks.length,
                          itemBuilder: (BuildContext context, int index) {
                            return TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            TaskDetails(index: index),
                                      ));
                                },
                                child: Text(
                                    "${context.watch<TasksCubit>().tasks[index].title}"));
                          },
                        )
                      : const Center(
                          child: Text("Error"),
                        );
            },
          ),
        ));
  }
}
