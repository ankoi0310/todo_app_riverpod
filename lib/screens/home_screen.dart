import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:todo_app_riverpod/config/routes/routes.dart';
import 'package:todo_app_riverpod/data/models/models.dart';
import 'package:todo_app_riverpod/utils/extensions.dart';
import 'package:todo_app_riverpod/utils/task_category.dart';
import 'package:todo_app_riverpod/widgets/task_list.dart';
import 'package:todo_app_riverpod/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  static HomeScreen builder(BuildContext context, GoRouterState state) => const HomeScreen();

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final color = context.colorScheme;
    final deviceSize = context.deviceSize;

    return Scaffold(
      body: Stack(
        children: [
          ShaderMask(
            shaderCallback: (rect) {
              return const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black45,
                  Colors.transparent,
                ],
              ).createShader(
                Rect.fromLTRB(0, 0, rect.width, rect.height),
              );
            },
            blendMode: BlendMode.srcATop,
            child: Container(
              height: deviceSize.height * 0.3,
              color: color.primary,
            ),
          ),

          Column(
            children: [
              Container(
                height: deviceSize.height * 0.3,
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateFormat.yMMMMd().format(DateTime.now()),
                      style: context.textTheme.titleLarge!.copyWith(
                        color: color.onPrimary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'My Todo List',
                      style: context.textTheme.headlineLarge!.copyWith(
                        color: color.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          // ListView tasks
          Positioned.fill(
            top: 120,
            child: SafeArea(
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: deviceSize.width,
                      height: deviceSize.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color.primaryContainer,
                      ),
                      child: TaskList(
                        tasks: [
                          Task(
                            id: 1,
                            title: 'Buy Groceries',
                            note: 'Buy milk, bread, and eggs',
                            time: '10:00 AM',
                            date: 'Oct 10, 2024',
                            category: TaskCategory.shopping,
                            isCompleted: false,
                          ),
                          Task(
                            id: 2,
                            title: 'Meeting with Client',
                            note: 'Discuss project requirements',
                            time: '2:00 PM',
                            date: 'Oct 10, 2024',
                            category: TaskCategory.work,
                            isCompleted: false,
                          ),
                        ],
                      ),
                    ),
                    const Gap(20),
                    Text(
                      'Completed',
                      style: context.textTheme.headlineMedium,
                    ),
                    const Gap(10),
                    Container(
                      width: deviceSize.width,
                      height: deviceSize.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: color.primaryContainer,
                      ),
                      child: TaskList(
                        tasks: [
                          Task(
                            id: 1,
                            title: 'Buy Groceries',
                            note: 'Buy milk, bread, and eggs',
                            time: '10:00 AM',
                            date: 'Oct 10, 2024',
                            category: TaskCategory.shopping,
                            isCompleted: true,
                          ),
                          Task(
                            id: 2,
                            title: 'Meeting with Client',
                            note: 'Discuss project requirements',
                            time: '2:00 PM',
                            date: 'Oct 10, 2024',
                            category: TaskCategory.work,
                            isCompleted: true,
                          ),
                        ],
                        isCompleted: true,
                      ),
                    ),
                    const Gap(20),
                    CommonButton(
                      onPressed: () => context.push(RouteLocation.createTask),
                      text: 'Add New Task',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
