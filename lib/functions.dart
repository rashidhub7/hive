import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/adapters.dart';

import 'model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> studentAdd(StudentModel value) async {
  final  studentDB = await Hive.openBox<StudentModel> ("student_db");
 final _id= await studentDB.add(value);
  value.id=_id;
  studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}


Future<void> getAllData()async{
  final  studentDB = await Hive.openBox<StudentModel> ("student_db");
  studentListNotifier.value.clear();
  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteData(int id) async{
  final  studentDB = await Hive.openBox<StudentModel> ("student_db");
  studentDB.delete(id);
  getAllData();
}