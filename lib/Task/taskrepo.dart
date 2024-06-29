import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:taskbuilder/Screens/Home.dart';
import 'package:taskbuilder/Task/taskmodel.dart';
import 'package:taskbuilder/User/usermodel.dart';

class TaskRepository {
  static final _db = FirebaseFirestore.instance;

  static Future<void> addTask(
      Taskmodel task, UserModel user, BuildContext context) async {
    try {
      DocumentReference userDocRef = _db.collection("Users").doc(user.username);
      await userDocRef.collection("Tasks").add(task.toJson());
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Task added successfully")));
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("An error occurred: $e")));
      print("Error adding task: $e"); // Debug log
    }
  }

  static Future<List<Taskmodel>?> getUserTasks(UserModel user) async {
    try {
      DocumentReference userDocRef = _db.collection("Users").doc(user.username);
      QuerySnapshot<Map<String, dynamic>> snapshot = await userDocRef.collection("Tasks").get();

      if (snapshot.docs.isNotEmpty) {
        List<Taskmodel> tasks = snapshot.docs.map((doc) {
          return Taskmodel.fromSnapshot(doc);
        }).toList();
        return tasks;
      } else {
        print("No tasks found for user: ${user.username}"); // Debug log
        return null;
      }
    } catch (e) {
      print("Error fetching user tasks: $e"); // Debug log
      return null;
    }
  }

  static Future<void> updateTaskCompletion(Taskmodel task, bool completed, UserModel user) async {
    try {
      DocumentReference userDocRef = _db.collection("Users").doc(user.username);
      QuerySnapshot<Map<String, dynamic>> snapshot = await userDocRef.collection("Tasks")
          .where("Task", isEqualTo: task.task)
          .get();

      if (snapshot.docs.isNotEmpty) {
        DocumentReference taskDocRef = snapshot.docs.first.reference;
        await taskDocRef.update({"Completed": completed});
        print("Task updated successfully");
      } else {
        print("Task not found for user: ${user.username}");
      }
    } catch (e) {
      print("Error updating task completion: $e"); // Debug log
    }
  }
  static Future<void> deleteTask(Taskmodel task, UserModel user, BuildContext context) async {
    try {
      DocumentReference userDocRef = _db.collection("Users").doc(user.username);
      QuerySnapshot<Map<String, dynamic>> snapshot = await userDocRef
          .collection("Tasks")
          .where("Task", isEqualTo: task.task) // Adjust to use a unique identifier, like task ID
          .get();

      if (snapshot.docs.isNotEmpty) {
        DocumentReference taskDocRef = snapshot.docs.first.reference;
        await taskDocRef.delete();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Task deleted successfully")),
        );
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      } else {
        print("Task not found for user: ${user.username}");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("An error occurred: $e")),
      );
      print("Error deleting task: $e"); // Debug log
    }
  }
  
}
