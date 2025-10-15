
import 'package:flutter/material.dart';
import 'homework.dart';

typedef ToggleCallback = void Function(String id);

class HomeworkTile extends StatelessWidget {
  final Homework hw;
  final ToggleCallback onToggle;

  const HomeworkTile({Key? key, required this.hw, required this.onToggle}) : super(key: key);

  String _dateToString(DateTime d) {
    final dt = d.toLocal();
    return "${dt.year.toString().padLeft(4,'0')}-${dt.month.toString().padLeft(2,'0')}-${dt.day.toString().padLeft(2,'0')}";
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: hw.completed,
        onChanged: (_) => onToggle(hw.id),
      ),
      title: Text(
        hw.title,
        style: TextStyle(
          decoration: hw.completed ? TextDecoration.lineThrough : null,
        ),
      ),
      subtitle: Text("${hw.subject} • Due: ${_dateToString(hw.dueDate)}"),
      trailing: hw.completed ? const Icon(Icons.check_circle, color: Colors.green) : null,
    );
  }
}


