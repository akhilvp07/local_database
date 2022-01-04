import 'package:flutter/foundation.dart';
import 'package:local_database/db/model/data_model.dart';
import 'package:sqflite/sqflite.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

late Database _db;

Future<void> initDatabase() async {
  _db = await openDatabase(
    'student.db',
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE student (id INTEGER PRIMARY KEY, name TEXT, age TEXT)');
    },
  );
}

Future<void> addStudent(StudentModel value) async {
  _db.rawInsert(
      'INSERT INTO student(name, age) VALUES(?, ?)', [value.name, value.age]);
  getAllStudents();
}

//read DB and add it to list.
Future<void> getAllStudents() async {
  final _values = await _db.rawQuery('SELECT * FROM student');
  print(_values);

  //Clear the local List
  studentListNotifier.value.clear();

  for (var map in _values) {
    //Convert Map to StudentModel
    final student = StudentModel.fromMap(map);
    //Add DB data to the List
    studentListNotifier.value.add(student);
    studentListNotifier.notifyListeners();
  }
}

Future<void> deleteStudent(int? id) async {
  await _db.rawDelete('DELETE FROM student WHERE id = ?', [id]);
  getAllStudents();
}
