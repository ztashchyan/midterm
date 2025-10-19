import 'package:flutter/material.dart';
import 'homework_bloc.dart';
import 'homework_tile.dart';
import 'add_homework_screen.dart';
import 'homework.dart';

class HomeworkListScreen extends StatelessWidget {
  final HomeworkBloc bloc;

  const HomeworkListScreen({Key? key, required this.bloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Homework Tracker'),
        centerTitle: true,
      ),
      body: StreamBuilder<List<Homework>>(
        stream: bloc.stream,
        initialData: const [],
        builder: (context, snapshot) {
          final list = snapshot.data ?? [];
          if (list.isEmpty) {
            return const Center(child: Text('No homework yet. Tap + to add.'));
          }
          return ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: list.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final hw = list[index];
              return HomeworkTile(
                hw: hw,
                onToggle: (id) => bloc.toggleComplete(id),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (_) => AddHomeworkScreen(bloc: bloc)),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}


