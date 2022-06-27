class TaskModel {
  final String? name;
    bool isDone;

  TaskModel({required this.name, required this.isDone});

  void doneChange() {
    isDone = !isDone;
  }
}
