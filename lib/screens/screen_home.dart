import 'package:flutter/material.dart';
import 'package:local_database/screens/widgets/add_student_widget.dart';
import 'package:local_database/screens/widgets/list_student_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SafeArea(
        child: Column(
          children:  [
            AddStudentWidget(),
            const Expanded(
              child: ListStudentWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
