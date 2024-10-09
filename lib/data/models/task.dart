import 'package:equatable/equatable.dart';
import 'package:todo_app_riverpod/utils/task_category.dart';

class Task extends Equatable {
  final int? id;
  final String title;
  final String note;
  final String time;
  final String date;
  final bool isCompleted;
  final TaskCategory category;

  Task({
    this.id,
    required this.title,
    required this.note,
    required this.time,
    required this.date,
    required this.isCompleted,
    required this.category,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        note,
        time,
        date,
        isCompleted,
        category,
      ];
}
