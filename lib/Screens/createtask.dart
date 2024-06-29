import 'package:flutter/material.dart';
import 'package:taskbuilder/Controllers/signin_controller.dart';
import 'package:taskbuilder/Helperfunction/helper.dart';
import 'package:taskbuilder/Screens/Home.dart';
import 'package:taskbuilder/Task/taskcontroller.dart';
import 'package:taskbuilder/Task/taskmodel.dart';
import 'package:taskbuilder/Task/taskrepo.dart';
import 'package:taskbuilder/User/usermodel.dart';
import 'package:taskbuilder/User/userrepo.dart';

class CreateTask extends StatefulWidget {
  const CreateTask({super.key});

  @override
  State<CreateTask> createState() => _CreateTaskState();

  static String type = "";
  static String category = "";
}

class _CreateTaskState extends State<CreateTask> {
  
  bool isimp = false;
  bool isplan = false;
  bool isfood = false;
  bool isworkout = false;
  bool iswork = false;
  bool issocial = false;
  bool isfitness = false;
  bool isother = false;

  void _setType(String type) {
    setState(() {
      isimp = type == "Important";
      isplan = type == "Planned";
    });
    CreateTask.type = type;
  }

  void _setCategory(String category) {
    setState(() {
      isfood = category == "Food";
      isworkout = category == "Workout";
      iswork = category == "Work";
      issocial = category == "Social";
      isfitness = category == "Fitness";
      isother = category == "Other";
    });
    CreateTask.category = category;
  }

  @override
  Widget build(BuildContext context) {
    final dark = Helperfunctions.isDarkMode(context);
       
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              icon: Icon(
                Icons.arrow_back,
                color: dark ? Colors.white : Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "Create",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                "New Task",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Task Title',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(right: 24, left: 16),
              child: TextFormField(
                controller: Taskcontroller.taskController,
                decoration: InputDecoration(
                  labelText: "Task Title",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "Task Type",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Row(
                children: [
                  TextButton(
                    onPressed: () => _setType("Important"),
                    child: Text(
                      "Important",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        isimp
                          ? Color.fromARGB(255, 101, 100, 100)
                          : Color.fromARGB(255, 189, 25, 25),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  TextButton(
                    onPressed: () => _setType("Planned"),
                    child: Text(
                      "Planned",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        isplan
                          ? Color.fromARGB(255, 101, 100, 100)
                          : Color.fromARGB(255, 90, 42, 138),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          Padding(
  padding: const EdgeInsets.only(right: 24, left: 16),
  child: TextFormField(
    controller: Taskcontroller.descriptionController,
    maxLength: 35, // Limit the maximum number of characters
    maxLines: 4,
    decoration: InputDecoration(
      border: OutlineInputBorder(),
      hintText: "Enter your description here...",
    ),
    // Optional: You can add a validator to enforce the character limit
    validator: (value) {
      if (value!.length > 30) {
        return 'Description cannot exceed 30 characters.';
      }
      return null;
    },
  ),
),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "Category",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      TextButton(
                        onPressed: () => _setCategory("Food"),
                        child: Text(
                          "Food",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            isfood
                              ? Color.fromARGB(255, 101, 100, 100)
                              : Color.fromARGB(255, 85, 196, 230),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      TextButton(
                        onPressed: () => _setCategory("Workout"),
                        child: Text(
                          "Work Out",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            isworkout
                              ? Color.fromARGB(255, 101, 100, 100)
                              : Color.fromARGB(255, 238, 110, 217),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      TextButton(
                        onPressed: () => _setCategory("Work"),
                        child: Text(
                          "Work",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            iswork
                              ? Color.fromARGB(255, 101, 100, 100)
                              : Color.fromARGB(255, 169, 83, 40),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () => _setCategory("Social"),
                        child: Text(
                          "Social",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            issocial
                              ? Color.fromARGB(255, 101, 100, 100)
                              : Color.fromARGB(255, 63, 167, 89),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      TextButton(
                        onPressed: () => _setCategory("Fitness"),
                        child: Text(
                          "Fitness",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            isfitness
                              ? Color.fromARGB(255, 101, 100, 100)
                              : Color.fromARGB(255, 101, 66, 91),
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      TextButton(
                        onPressed: () => _setCategory("Other"),
                        child: Text(
                          "Other",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            isother
                              ? Color.fromARGB(255, 101, 100, 100)
                              : Color.fromARGB(199, 241, 170, 71),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                child: TextButton(
                  onPressed: () async {
                    UserModel? usermodel = await UserRepository.getuseremail(
                        SigninController.email.text);
                    Taskmodel newTask = Taskcontroller.createTask(
                        CreateTask.type, CreateTask.category, false);
                    await TaskRepository.addTask(newTask, usermodel!, context);
                    await TaskRepository.getUserTasks(usermodel);
                    Taskcontroller.taskController.clear();
                    Taskcontroller.descriptionController.clear();
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                  child: Text(
                    "Add Task",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 24, 55, 141)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
