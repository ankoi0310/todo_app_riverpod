import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_riverpod/data/models/models.dart';
import 'package:todo_app_riverpod/utils/extensions.dart';
import 'package:todo_app_riverpod/widgets/widgets.dart';

class TaskList extends StatelessWidget {
  const TaskList({
    super.key,
    required this.tasks,
    this.isCompleted = false,
  });

  final List<Task> tasks;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    final deviceSize = context.deviceSize;
    final color = context.colorScheme;

    final emptyTaskMessage = isCompleted ? 'You have not completed any task yet' : 'You have no task to complete';

    return Container(
      width: deviceSize.width,
      height: deviceSize.height * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color.primaryContainer,
      ),
      child: tasks.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  emptyTaskMessage,
                  style: context.textTheme.titleLarge!.copyWith(
                    color: color.onPrimaryContainer,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : ListView.separated(
              itemCount: tasks.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.only(
                top: 16,
                bottom: 16,
                left: 16,
              ),
              itemBuilder: (context, index) {
                final task = tasks[index];
                return InkWell(
                  onLongPress: () {
                    // delete task
                  },
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return TaskDetail(task: task);
                      },
                    );
                  },
                  child: TaskTile(task: task),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Gap(12);
              },
            ),
    );
  }
}
