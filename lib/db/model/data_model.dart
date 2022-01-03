// Once after changing the class to Hive object,
// run the below line in terminal to generate the adapter
// flutter packages pub run build_runner watch --use-polling-watcher --delete-conflicting-outputs
// Also dont forget to add the part 'data_model.g.dart'; line along with import

import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel {
  @HiveField(0)
  int? id;
  
  @HiveField(1)
  final String name;

  @HiveField(2)
  final String age;

  StudentModel({required this.name, required this.age, this.id});
}
