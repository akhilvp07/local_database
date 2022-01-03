import 'package:flutter/material.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx, index) {
        return ListTile(
          title: Text('Name $index'),
          subtitle: Text('Age $index'),
        );
      },
      separatorBuilder: (ctx, index) {
        return const Divider();
      },
      itemCount: 50,
    );
  }
}
