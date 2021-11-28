

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesy/getx_controller/controller.dart';
import 'package:notesy/screens/first_screen.dart';

import 'package:notesy/screens/new_note.dart';
import 'package:notesy/widgets/note_content.dart';

void main()async {
WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Notes',
      
      home: const FirstScreen(),
    );
  }
}

