

import 'package:path/path.dart';

import 'package:sqflite/sqflite.dart';
import 'package:notesy/models/notes.dart';



class DataBaseHelper{

  static DataBaseHelper? _baseHelper;
  static Database ? _database;

DataBaseHelper._createInstance();

factory DataBaseHelper(){

_baseHelper ??= DataBaseHelper._createInstance();

  return _baseHelper!;

}

// get data base 
Future<Database> get database async{
_database??=await  initalizeDatabase();
  return _database!;
}



// initalize database 
Future<Database> initalizeDatabase()async{
  var directory =await getDatabasesPath();
  String path= join(directory + 'myDb.db');

 var myDatabase= await openDatabase(path,version: 1,onCreate: _createDatabase);

 return myDatabase;
}


// create new table 
  void _createDatabase(Database db, int version) async {
 
  await db.execute(
      'CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT,dateTime TEXT)');
}


// get all elements in the database
Future<List<Map<String,dynamic>>>getAll()async{
Database db=await database;

var result=db.query('notes',orderBy: 'id ASC');
return result;

}


// insert new note
Future <int> insertNote(Note notes)async{
  var db=await database;
  var result=db.insert('notes', notes.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);

  print(notes.id);
  
  return result;
}


// update new note
Future <int> updatetNote(Note notes)async{
  var db=await database;
  var result=db.update('notes', notes.toMap(),where: 'id = ?',whereArgs: [notes.id]);
  return result;
}

// delete note
Future <int> deleteNote(int id)async{
  var db=await database;
  var result=db.delete('notes',where: 'id = ?',whereArgs: [id]);
  return result;
}



}






