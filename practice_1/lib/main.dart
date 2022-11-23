import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice_1/Screens/taken_picture_screen.dart';
import 'package:practice_1/firebase_options.dart';
import 'Screens/home_screen.dart';
import 'Screens/home_shopping.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  final cameras = await availableCameras();
  final String imagenPath;
  final first = cameras.first;

  runApp(SqliteApp(firstCamera: first,));
}

class SqliteApp extends StatelessWidget {
  final CameraDescription firstCamera;
  const SqliteApp({Key? key, required this.firstCamera}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SQLite Example',
      initialRoute: 'home',
      routes: {
        'home':(context) => HomePageWidget(
          firstCamera: firstCamera,
        )
      },
/*       theme: ThemeData.light().copyWith(
        appBarTheme: const AppBarTheme(
          /* color: Color(0xFF38004D) */
        )
      ), */
    );
  }
}

