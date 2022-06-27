import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit.dart';
import '../bloc/states.dart';

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final void Function(bool?) checkBoxChange;
  final void Function() deleteTask;
  final bool isCheck;

  const TaskTile(
      {Key? key,
      required this.taskTitle,
      required this.checkBoxChange,
        required this.isCheck,
        required this.deleteTask})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return ListTile(
          title:  Text(taskTitle),
          trailing: Checkbox(
            activeColor: Colors.teal[400],
            value: isCheck,
            onChanged: checkBoxChange,
          ),
          onLongPress: deleteTask,
        );
      },
    );
  }
}
