import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_riverpod/data/models/models.dart';
import 'package:todo_app_riverpod/utils/extensions.dart';
import 'package:todo_app_riverpod/widgets/circle_container.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    this.onCompleted,
  });

  final Task task;
  final Function(bool?)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme;
    final style = context.textTheme;
    final iconOpacity = task.isCompleted ? 0.3 : 0.5;
    final backgroundOpacity = task.isCompleted ? 0.1 : 0.3;
    final textDecoration = task.isCompleted ? TextDecoration.lineThrough : TextDecoration.none;
    final fontWeight = task.isCompleted ? FontWeight.normal : FontWeight.bold;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleContainer(
          color: task.category.color.withOpacity(backgroundOpacity),
          child: Icon(
            task.category.icon,
            color: task.category.color.withOpacity(iconOpacity),
          ),
        ),
        const Gap(16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                task.title,
                style: style.titleMedium!.copyWith(
                  decoration: textDecoration,
                  fontSize: 20,
                  fontWeight: fontWeight,
                ),
              ),
              const Gap(4),
              Text(
                task.time,
                style: style.titleMedium!.copyWith(
                  decoration: textDecoration,
                ),
              ),
            ],
          ),
        ),
        Checkbox(
          value: task.isCompleted,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
