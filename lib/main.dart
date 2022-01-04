import 'package:flutter/material.dart';
import 'package:local_database/db/functions/db_functions.dart';
import 'package:local_database/screens/screen_home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Init SQFlite
  await initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of the application.
        primarySwatch: Colors.blue,
      ),
      home: const ScreenHome(),
    );
  }
}
