import 'package:path/path.dart';
import 'package:setting/model/courses.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper{
  static final DbHelper _instance = DbHelper.internal();
  factory DbHelper() => _instance;
  DbHelper.internal();
  static Database? _db;
   Future <Database> createDatabase() async {
    if(_db != null){
      return _db!;
    }
    String  path = join(await getDatabasesPath(),'school.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate:(Database db,int v){
        db.execute('create table courses(id integer primary key autoincrement, name varchar(50), content varchar(250), hours integer)');
      }
      
      );
      return _db!;
      
  }
  Future<int> createCourses(Courses course) async{
  
  Database db = await createDatabase();
  return db.insert('courses', course.toMap());

  }
  Future<List> allCourses()async{
    Database db = await createDatabase();
    return db.query('courses');
  }
  Future<int> delete(int id) async {
    Database db = await createDatabase();
    return db.delete('courses',where: 'id = ?',whereArgs: [id]);
  }
}