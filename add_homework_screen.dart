import 'package:flutter/material.dart';
import 'homework_bloc.dart';

class AddHomeworkScreen extends StatefulWidget {
  final HomeworkBloc bloc;
  const AddHomeworkScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  State<AddHomeworkScreen> createState() => _AddHomeworkScreenState();
}

class _AddHomeworkScreenState extends State<AddHomeworkScreen> {
  final _formKey = GlobalKey<FormState>();
  final _subjectCtrl = TextEditingController();
  final _titleCtrl = TextEditingController();
  DateTime? _dueDate;

  @override
  void dispose() {
    _subjectCtrl.dispose();
    _titleCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: _dueDate ?? now,
      firstDate: DateTime(now.year - 1),
      lastDate: DateTime(now.year + 5),
    );
    if (picked != null) setState(() => _dueDate = picked);
  }

  void _save() {
    if (!_formKey.currentState!.validate()) return;
    if (_dueDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Please pick a due date.')));
      return;
    }
    widget.bloc.addHomework(
      subject: _subjectCtrl.text.trim(),
      title: _titleCtrl.text.trim(),
      dueDate: _dueDate!,
    );
    Navigator.of(context).pop(); // return to list
  }

  @override
  Widget build(BuildContext context) {
    final dueText = _dueDate == null ? 'Pick due date' : "${_dueDate!.year}-${_dueDate!.month.toString().padLeft(2,'0')}-${_dueDate!.day.toString().padLeft(2,'0')}";
    return Scaffold(
      appBar: AppBar(title: const Text('Add Homework')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _subjectCtrl,
                decoration: const InputDecoration(labelText: 'Subject'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter subject' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _titleCtrl,
                decoration: const InputDecoration(labelText: 'Homework title'),
                validator: (v) => (v == null || v.trim().isEmpty) ? 'Enter title' : null,
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: Text(dueText)),
                  TextButton(
                    onPressed: _pickDate,
                    child: const Text('Choose Date'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _save,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
