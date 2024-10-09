import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_app_riverpod/widgets/widgets.dart';

class CreateTaskScreen extends StatelessWidget {
  const CreateTaskScreen({super.key});

  static CreateTaskScreen builder(BuildContext context, GoRouterState state) => const CreateTaskScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create New Task'),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: const TaskForm(),
    );
  }
}
