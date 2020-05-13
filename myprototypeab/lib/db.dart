import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'taskModel.dart';


class TodoHelper{
  Database db;

  TodoHelper(){
    initDatabase();
  }
  

  Future<void> initDatabase() async{
    db = await openDatabase(
      join(await getDatabasesPath(), "databse.db"),
      onCreate: (db, version){
        return db.execute("CREATE TABLE $tableName($columnID INTEGER PRIMARY KEY AUTOINCREMENT, $columnName TEXT)");
      },
      version: 1
    );
  }

  Future<void> insertTask(TaskModel task) async{
    try{
      db.insert(tableName, task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    }catch(_){
      print(_);
    }
  }

  Future<List<TaskModel>> getAllTask () async{
    final List<Map<String, dynamic>> tasks = await db.query(tableName);

    return List.generate(tasks.length, (i){
      return TaskModel(name: tasks[i][columnName], id: tasks[i][columnID]);
    });
  }

}