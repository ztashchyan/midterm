import 'dart:async';
import 'homework.dart';

class HomeworkBloc {
  final List<Homework> _homeworks = [];
  final _controller = StreamController<List<Homework>>.broadcast();

  Stream<List<Homework>> get stream => _controller.stream;
  void _emit() => _controller.sink.add(List.unmodifiable(_homeworks));

  void addHomework({
    required String subject,
    required String title,
    required DateTime dueDate,
  }) {
    final hw = Homework(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      subject: subject,
      title: title,
      dueDate: dueDate,
    );
    _homeworks.add(hw);
    _emit();
  }

  void toggleComplete(String id) {
    final idx = _homeworks.indexWhere((h) => h.id == id);
    if (idx == -1) return;
    _homeworks[idx].completed = !_homeworks[idx].completed;
    _emit();
  }

  void dispose() {
    _controller.close();
  }
}
