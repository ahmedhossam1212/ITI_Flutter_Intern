import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iti_flutter_intern/data/cubit/tasks_cubite.dart';
import 'package:iti_flutter_intern/data/state/tasks_state.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("TASKS DETAILS"),
        ),
        body: BlocProvider(
          create: (context) => TasksCubit(),
          child: BlocConsumer<TasksCubit, TasksState>(
            listener: (context, state) {
              if (state is TasksLoadingState) {
                print("Loading");
              }
            },
            builder: (context, state) {
              return state is TasksLoadingState
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : state is TasksSuccessState
                      ? Column(
                          children: [
                            Text(
                                "${context.watch<TasksCubit>().tasks[index].title}"),
                            Text(
                                "${context.watch<TasksCubit>().tasks[index].id}"),
                            Text(
                                "${context.watch<TasksCubit>().tasks[index].userId}"),
                            Text(
                                "${context.watch<TasksCubit>().tasks[index].completed}"),
                          ],
                        )
                      : const Center(
                          child: Text("Error"),
                        );
            },
          ),
        ));
  }
}
