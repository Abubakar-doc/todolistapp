import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todolistapp/MODEL/services.dart';
import 'package:todolistapp/MODEL/todoModel.dart';
import 'package:todolistapp/THEME/theme.dart';
import 'package:todolistapp/UTILS/utils.dart';

class CreateTaskScreen extends StatefulWidget {
  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  late String _taskName;
  late TimeOfDay _startTime;
  late TimeOfDay _endTime;
  final TodoService _todoService = TodoService();

  @override
  void initState() {
    super.initState();
    _taskName = '';
    _startTime = TimeOfDay.now();
    _endTime = TimeOfDay.now();
    openBox(); // Ensure box is opened when the screen initializes
  }

  void openBox() async {
    await Hive.openBox<TodoTask>('tasks');
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _startTime,
    );
    if (picked != null && picked != _startTime) {
      setState(() {
        _startTime = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: _endTime,
    );
    if (picked != null && picked != _endTime) {
      setState(() {
        _endTime = picked;
      });
    }
  }

  void _addTask() async {
    try {
      await _todoService.addTask(
        taskName: _taskName,
        startTime: _startTime.format(context),
        endTime: _endTime.format(context),
        isCompleted: false,
      );
      Navigator.pop(context);
      Utils().greentoastmsg('Task Added Successfully',
          context); // Adjust for context usage or pass context if needed
    } catch (e) {
      Utils().toastmsg(e.toString(), context); // Handle error or show message
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = theme.brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Task'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Add Task',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Name your task',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        borderSide: BorderSide.none,
                      ),
                      // focusedBorder: InputBorder.none,
                      // enabledBorder: InputBorder.none,
                      filled: true,
                      fillColor: isDarkMode
                          ? Colors.grey.shade900
                          : Colors.grey.shade200,
                      contentPadding: const EdgeInsets.all(18),
                    ),
                    onChanged: (value) {
                      setState(() {
                        _taskName = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Start',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => _selectStartTime(context),
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? Colors.grey.shade900
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        _startTime.format(context),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'End',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () => _selectEndTime(context),
                    child: Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: isDarkMode
                            ? Colors.grey.shade900
                            : Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        _endTime.format(context),
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                _addTask();
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: customPurple,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Create Task',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
