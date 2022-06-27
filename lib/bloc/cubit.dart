 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_app_bloc/bloc/states.dart';
import 'package:today_app_bloc/model/task_model.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isChecked = false;
  int index = 0;
  List<TaskModel> tasks = [
    TaskModel(name:"gym",),
    TaskModel(name:"home",),

  ];

  void isDone(TaskModel task)
  {
    task.doneChange();
    emit(IsCheckedState());
  }
  void addTask(String newTask)
  {
    tasks.add(TaskModel(name: newTask));
    emit(AppSuccessAddState());
  }

  void deleteTask(TaskModel taskModel)
  {
    tasks.remove(taskModel);
    emit(RemoveTaskState());
  }
}