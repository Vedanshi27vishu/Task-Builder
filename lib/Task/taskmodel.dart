import 'package:cloud_firestore/cloud_firestore.dart';

class Taskmodel {
  String task;
  String type;
  String description;
  String category;
  bool completed; 
  String id; 

  Taskmodel({
    required this.task,
    required this.type,
    required this.description,
    required this.category,
    required this.completed,
     required this.id,
  });

  Map<String, dynamic> toJson() {
    return {
      "Task": task,
      "Type": type,
      "Description": description,
      "Category": category,
      "Completed": completed,  // Added completed field to JSON
    };
  }

  factory Taskmodel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return Taskmodel(
       id: document.id,
      task: data["Task"] ?? '',
      type: data["Type"] ?? '',
      description: data["Description"] ?? '',
      category: data["Category"] ?? '',
      completed: data["Completed"] ?? false,  // Ensure a default value
    );
  }
}
