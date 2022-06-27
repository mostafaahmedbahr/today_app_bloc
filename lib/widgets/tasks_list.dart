import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_app_bloc/bloc/cubit.dart';
import 'package:today_app_bloc/bloc/states.dart';
import 'package:today_app_bloc/widgets/task-tile.dart';
class TasksList extends StatelessWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = AppCubit.get(context);
        return ListView.builder(
            itemCount: cubit.tasks.length,
            itemBuilder: (context,index)
            {
              return TaskTile(
                taskTitle:cubit.tasks[index],
                checkBoxChange: (newValue) {
                   cubit.isDone(cubit.tasks[index]);
                },
                isCheck: cubit.isChecked,
                deleteTask: () {
                  cubit.deleteTask(cubit.tasks[index]);
                } ,
              );
            });
      },

    );
  }
}
