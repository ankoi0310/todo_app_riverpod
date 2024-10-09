import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_riverpod/data/models/models.dart';
import 'package:todo_app_riverpod/utils/extensions.dart';
import 'package:todo_app_riverpod/widgets/circle_container.dart';

class TaskDetail extends StatelessWidget {
  const TaskDetail({super.key, required this.task});

  final Task task;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(0.3),
            child: Icon(
              task.category.icon,
              color: task.category.color,
            ),
          ),
          Gap(16),
          Text(
            task.title,
            style: style.titleLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Gap(8),
          Text(
            task.time,
            style: style.titleMedium!.copyWith(
              color: Colors.grey,
            ),
          ),
          Gap(16),
          Visibility(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Task to be completed on ${task.date}',
                  style: style.titleMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(8),
                Icon(
                  Icons.check_box,
                  color: task.category.color,
                ),
              ],
            ),
          ),
          const Gap(16),
          Text(
            task.note.isEmpty
                ? 'There is no additional note for this task'
                : task.note,
          ),
        ],
      ),
    );
  }
}
