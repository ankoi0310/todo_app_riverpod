import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todo_app_riverpod/widgets/widgets.dart';

class SelectDateTime extends StatelessWidget {
  const SelectDateTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            text: 'Date',
            hintText: 'Oct 10, 2024',
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () => _selectDate(context),
              icon: const Icon(Icons.calendar_today),
            ),
          ),
        ),
        const Gap(16),
        Expanded(
          child: CommonTextField(
            text: 'Time',
            hintText: '10:00 AM',
            readOnly: true,
            suffixIcon: IconButton(
              onPressed: () => _selectTime(context),
              icon: const Icon(Icons.access_time),
            ),
          ),
        ),
      ],
    );
  }

  void _selectTime(BuildContext context) async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (time != null) {
      print('Selected time: $time');
    }
  }

  void _selectDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    );

    if (date != null) {
      print('Selected date: $date');
    }
  }
}
