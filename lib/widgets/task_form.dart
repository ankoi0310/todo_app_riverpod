import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_riverpod/utils/task_category.dart';
import 'package:todo_app_riverpod/widgets/widgets.dart';

class TaskForm extends StatelessWidget {
  const TaskForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const CommonTextField(
            text: 'Title',
            hintText: 'Enter task title',
          ),
          const Gap(16),
          Row(
            children: [
              Text(
                'Category',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Gap(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  children: [
                    ...TaskCategory.values.map(
                      (category) => Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                          child: CircleAvatar(
                            backgroundColor: category.color,
                            radius: 24,
                            child: Icon(
                              category.icon,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Gap(16),
          const SelectDateTime(),
          const Gap(16),
          const CommonTextField(
            text: 'Note',
            hintText: 'Task note',
            maxLines: 5,
          ),
          const Spacer(),
          CommonButton(
            text: 'Save',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
