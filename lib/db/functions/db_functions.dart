import 'package:flutter/foundation.dart';
import 'package:local_database/db/model/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  // final studentDB = await Hive.openBox<StudentModel>('student_db');
  // final _id = await studentDB.add(value);

  //Update the id in L add the new student
  //value.id = _id;
  //Update the id back to the DB
  //await studentDB.put(_id, value);

  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
  //Since the ValueNotifier value doesn't change for list add, it is not automatically notofied to the listeners.
  //To avoid warning, use the below line instead of add/notofy steps.
  //studentListNotifier.value = List.from(studentListNotifier.value)..add(value);
}

//read DB and add it to list.
Future<void> getAllStudents() async {
  //open DB
  //final studentDB = await Hive.openBox<StudentModel>('student_db');
  //Clear the List
  studentListNotifier.value.clear();
  //Add DB date to the List
  //studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int? id) async {
  //final studentDB = await Hive.openBox<StudentModel>('student_db');
  //await studentDB.delete(id);
  getAllStudents();
}
