import 'dart:io';

void main() {
  List<String> todoList = [];
  bool exitProgram = false;

  while (!exitProgram) {
    print("\n1. Add a task");
    print("2. View tasks");
    print("3. Remove a task");
    print("4. Exit");
    stdout.write("Choose an option: ");
    String? option = stdin.readLineSync();

    switch (option) {
      case '1':
        addTask(todoList);
        break;
      case '2':
        viewTasks(todoList);
        break;
      case '3':
        removeTask(todoList);
        break;
      case '4':
        exitProgram = true;
        print("Exiting program...");
        break;
      default:
        print("Invalid option. Please choose again.");
    }
  }
}

void addTask(List<String> todoList) {
  stdout.write("Enter the task: ");
  String? task = stdin.readLineSync();
  if (task != null && task.isNotEmpty) {
    todoList.add(task);
    print("Task added.");
  } else {
    print("Task cannot be empty.");
  }
}

void viewTasks(List<String> todoList) {
  if (todoList.isEmpty) {
    print("No tasks available.");
  } else {
    print("Your tasks:");
    for (int i = 0; i < todoList.length; i++) {
      print("${i + 1}. ${todoList[i]}");
    }
  }
}

void removeTask(List<String> todoList) {
  if (todoList.isEmpty) {
    print("No tasks to remove.");
    return;
  }

  viewTasks(todoList);
  stdout.write("Enter the number of the task to remove: ");
  String? input = stdin.readLineSync();

  int? taskNumber = int.tryParse(input ?? '');
  if (taskNumber == null || taskNumber <= 0 || taskNumber > todoList.length) {
    print("Invalid task number.");
  } else {
    todoList.removeAt(taskNumber - 1);
    print("Task removed.");
  }
}
