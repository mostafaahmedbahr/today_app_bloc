 import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_app_bloc/bloc/states.dart';

class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  bool isChecked = false;
  int index = 0;
  List tasks = [
    "go to school",
    "go to gym",

  ];

  void isDone(task)
  {
    isChecked =! isChecked;
    emit(IsCheckedState());
  }
  void addTask(String newTask)
  {
    tasks.add(newTask);
    emit(AppSuccessAddState());
  }

  void deleteTask(String newTask)
  {
    tasks.remove(newTask);
    emit(RemoveTaskState());
  }
}