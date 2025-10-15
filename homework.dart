class Homework {
  final int? id;
  final String title;
  final String subject;
  final String description;
  final String dueDate;
  bool completed;

  Homework({
    this.id,
    required this.title,
    required this.subject,
    required this.description,
    required this.dueDate,
    this.completed = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subject': subject,
      'title': title,
      'description': description,
      'dueDate': dueDate,
      'completed': completed ? 1 : 0,
    };
  }

  factory Homework.fromMap(Map<String, dynamic> map) {
    return Homework(
      id: map['id'],
      subject: map['subject'],
      title: map['title'],
      description: map['description'],
      dueDate: map['dueDate'],
      completed: map['completed'] == 1,
    );
  }
}
