import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesy/database/data_base_helper.dart';

import 'models/notes.dart';

class MyController extends GetxController{
  DataBaseHelper _baseHelper=DataBaseHelper();

  var currentIndex=0.obs;
  getCurrentIndex(int num){
    currentIndex=num.obs;
  }
  bool isDarkMode = true;

  void toggleDarkMode() {
    isDarkMode = !isDarkMode;
    if (isDarkMode) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
    update();
  }

RxList<Note> myNotes=<Note>[].obs;

Future<int> addNote(Note myNote){
return _baseHelper.insertNote(myNote);
}

 Future<void>getNotes()async{
final List<Map<String,dynamic>> note=await _baseHelper.getAll();
myNotes.assignAll(note.map((data) => Note.fromMap(data)).toList());
}

  void deleteNotes(Note note)async{
await _baseHelper.deleteNote(note.id!);
getNotes();

  }

 void updateNotes(Note note)async{

await _baseHelper.updatetNote(note);
getNotes();
  }


}