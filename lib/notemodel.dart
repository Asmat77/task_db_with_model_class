import 'package:new_task/dbhelper.dart';

class NoteModel{

  int? id;
  String title;
  String desc;


  NoteModel({required this.title, required this.desc, this.id});


  factory NoteModel.fromMap(Map<String ,dynamic> map){
    return NoteModel(title: map[DBHelper.NOTE_COLUMN_TITLE], desc: map[DBHelper.NOTE_COLUMN_DESC]);
}


  Map<String,dynamic> toMap(){
    return {
      DBHelper.NOTE_COLUMN_DESC:desc,
      DBHelper.NOTE_COLUMN_TITLE:title
    };

  }

}