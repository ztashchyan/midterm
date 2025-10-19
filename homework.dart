class Homework {
  final String id;
  final String title;
  final String subject;
  final String? description;
  final DateTime dueDate;
  bool completed;


  Homework({
    required this.id,
    required this.title,
    required this.subject,
    this.description,
    required this.dueDate,
    this.completed = false,
  });


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'subject': subject,
      'title': title,
      'description': description,
      'dueDate': dueDate.toIso8601String(),
      'completed': completed ? 1 : 0,
    };
  }


  factory Homework.fromMap(Map<String, dynamic> map) {
    return Homework(
      id: map['id'].toString(),
      subject: map['subject'] ?? '',
      title: map['title'] ?? '',
      description: map['description']?.toString(),
      dueDate: DateTime.parse(map['dueDate'].toString()),
      completed: (map['completed'] == 1 || map['completed'] == true),
    );
  }
}
