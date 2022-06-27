import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:today_app_bloc/bloc/cubit.dart';
import 'package:today_app_bloc/bloc/states.dart';
import 'package:today_app_bloc/widgets/tasks_list.dart';

import 'add_tasks.dart';
class TasksScreen extends StatelessWidget {
  const TasksScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.teal[400],
          body: Container(
            padding: const EdgeInsets.only(
              top: 60,
              left: 20,
              bottom: 45,
              right: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:   [
                Row(
                  children: const [
                    Icon(Icons.playlist_add_check,
                      size: 40,
                      color: Colors.white,
                    ),
                    SizedBox(width: 20,),
                    Text("ToDay List",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),),
                  ],
                ),
                 Text("${cubit.tasks.length} Tasks",
                  style:const TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),),
                const SizedBox(height: 20,),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child:  const TasksList(),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.indigo[400],
            child: const Icon(Icons.add),
            onPressed: (){
              showModalBottomSheet(context: context,
                isScrollControlled: true,
                builder: (context)
                {
                  return SingleChildScrollView(child: Container(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom,
                      ),
                      child:  AddTasks(
                        addTask: (newTaskTitle){},
                      )));
                },
              );
            },
          ),
        );
      },

    );
  }
}
