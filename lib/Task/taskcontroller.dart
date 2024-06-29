import 'package:flutter/material.dart';
import 'package:taskbuilder/Task/taskmodel.dart';
import 'package:uuid/uuid.dart';

class Taskcontroller {
  static final taskController = TextEditingController();
  static final descriptionController = TextEditingController();
  static final _uuid = Uuid(); 

  static Taskmodel createTask(String type, String category, bool completed) {
    String taskId = _uuid.v4(); 
    return Taskmodel(
      id: taskId,
      task: taskController.text.trim(),
      description: descriptionController.text.trim(),
      type: type,
      category: category,
      completed: completed,  // Pass the completed status
    );
  }
}
