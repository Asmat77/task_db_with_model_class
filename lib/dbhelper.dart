import 'package:new_task/notemodel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper{

  static final String NOTE_TABLE="note";
  static final String NOTE_COLUMN_TITLE="note_title";
  static final String NOTE_COLUMN_DESC="note_desc";
  static final String NOTE_COLUMN_ID="note_id";


  DBHelper._();


  static DBHelper getInstance=DBHelper._();

  Database? mDB;

  Future<Database> initDB()async{
    mDB =mDB ?? await openDB();
    return mDB!;
  }

  Future<Database> openDB()async{
    var dirPath= await getApplicationDocumentsDirectory();
    var dbPath= join(dirPath.path,"Note.db");
    return openDatabase(dbPath,version: 1,onCreate: (db,version){
      db.execute("create table $NOTE_TABLE ( $NOTE_COLUMN_ID integer primary key autoincrement, $NOTE_COLUMN_TITLE, $NOTE_COLUMN_DESC)");
    });
  }

  Future<bool> addNote(NoteModel newModel)async{
    Database db=await initDB();
    int rowsEffected=await db.insert(NOTE_TABLE, newModel.toMap());
    return rowsEffected>0;
  }




  Future<List<NoteModel>> fetchNote()async{
    Database db=await initDB();
    List<NoteModel> mNotes=[];
    List<Map<String,dynamic>> allNotes=await db.query(NOTE_TABLE);
    for(Map<String,dynamic> eachData in allNotes){
      NoteModel eachNote =NoteModel.fromMap(eachData);
      mNotes.add(eachNote);
    }
    return mNotes;

  }


}