import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:taskbuilder/Controllers/signin_controller.dart';
import 'package:taskbuilder/Screens/createtask.dart';
import 'package:taskbuilder/Task/taskmodel.dart';
import 'package:taskbuilder/Task/taskrepo.dart';
import 'package:taskbuilder/User/usermodel.dart';
import 'package:taskbuilder/User/userrepo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserModel? user;
  List<Taskmodel>? tasks;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    UserModel? fetchedUser =
        await UserRepository.getuseremail(SigninController.email.text);
    List<Taskmodel>? fetchedTasks =
        await TaskRepository.getUserTasks(fetchedUser!);
    setState(() {
      user = fetchedUser;
      tasks = fetchedTasks;
    });
  }

  IconData _getCategoryIcon(String category) {
    switch (category) {
      case "Food":
        return Icons.fastfood;
      case "Workout":
        return Icons.fitness_center;
      case "Work":
        return Icons.work;
      case "Social":
        return Icons.people;
      case "Fitness":
        return Icons.directions_run;
      case "Other":
        return Icons.miscellaneous_services;
      default:
        return Icons.task;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the current date
    DateTime now = DateTime.now();
    // Format the date
    String formattedDate = DateFormat('EEEE, MMMM d, yyyy').format(now);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const CreateTask()));
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Today's Schedule",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                formattedDate,
                style: const TextStyle(fontSize: 24),
              ),
            ),
            if (tasks != null) _buildTaskList()
          ],
        ),
      ),
    );
  }

  Widget _buildTaskList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: tasks!.length,
      itemBuilder: (context, index) {
        Taskmodel task = tasks![index];
        return Row(
          children: [
            Checkbox(
              value: task.completed,
              onChanged: (bool? value) {
                setState(() {
                  task.completed = value ?? false;
                  TaskRepository.updateTaskCompletion(task, task.completed,
                      user!); // Make sure this method is implemented to update the task in your repository
                });
              },
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  height: 130,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 117, 89, 155),
                    border: Border.all(
                      color: Color.fromARGB(255, 43, 8, 148),
                      width: 2.0, // Adjust the width of the border if needed
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 3),
                                    child: Icon(
                                      _getCategoryIcon(task.category),
                                      color: Color.fromARGB(255, 215, 144, 171),
                                      size: 30,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    task.task,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 18,
                                      color: Color.fromARGB(255, 215, 144, 171),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Text(
                                    task.type,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 235, 234, 234),
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const SizedBox(width: 50.0),
                                  Text(
                                    task.category,
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 241, 234, 234),
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 3.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "AIM:: " + task.description,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        TaskRepository.deleteTask(
                                            task, user!, context);
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Color.fromARGB(255, 221, 54, 70),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}
