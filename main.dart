import 'package:flutter/material.dart';
import 'homework_bloc.dart';
import 'homework_list_screen.dart';

void main() {
  runApp(const HomeworkApp());
}

class HomeworkApp extends StatefulWidget {
  const HomeworkApp({Key? key}) : super(key: key);

  @override
  State<HomeworkApp> createState() => _HomeworkAppState();
}

class _HomeworkAppState extends State<HomeworkApp> {
  final HomeworkBloc _bloc = HomeworkBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Homework Tracker App',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: HomeworkListScreen(bloc: _bloc),
    );
  }
}

