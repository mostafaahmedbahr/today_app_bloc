import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit.dart';
import '../bloc/states.dart';
class AddTasks extends StatelessWidget {
  final Function addTask;

  const AddTasks({Key? key,required this.addTask, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
      String? newTaskTitle;
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context,state){},
      builder: (context,state){
        var cubit = AppCubit.get(context);
        return  Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:  [
              Text("Add Task",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.indigo[400],
                  fontWeight: FontWeight.bold,
                ),),
                TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (newText)
                {
                  newTaskTitle = newText;
                },
              ),
              const SizedBox(height: 30,),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal[400],
                  ),
                  onPressed: (){
                    cubit.addTask(newTaskTitle!);
                    Navigator.pop(context);
                  },
                  child: const Text("Add",
                    style: TextStyle(
                      fontSize: 20,
                    ),) ,
                ),
              ),
            ],
          ),
        );
      },

    );
  }
}
