import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// this is for Activity Table
final String tableNameActivity = "tbl_activityTable";
final String columnActivityID = "activityID";
final String columnActivityName = "activityName";
final String columnActivityDate = "activityDate";

class ActivityModel {
  int activityID;
  final String activityName;
  final String activityDate;

  ActivityModel({this.activityID, this.activityName, this.activityDate});

  Map<String, dynamic> toMap() {
    return {
      columnActivityName: this.activityName,
      columnActivityDate: this.activityDate
    };
  }
}

class ActivityHelper {
  Database database;

  ActivityHelper() {
    initDatabase();
  }

  Future<void> initDatabase() async {
    database = await openDatabase(join(await getDatabasesPath(), "databse.db"),
        onCreate: (db, version) {
      return db.execute('''
          CREATE TABLE $tableNameActivity($columnActivityID INTEGER PRIMARY KEY AUTOINCREMENT, 
          $columnActivityName TEXT,
          $columnActivityDate
          );         
          
          ''');
    }, version: 1);
  }

  Future<void> insertTask(ActivityModel task) async {
    try {
      database.insert(tableNameActivity, task.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (_) {
      print(_);
    }
  }

  Future<List<ActivityModel>> getAllTask() async {
    final List<Map<String, dynamic>> tasks =
        await database.query(tableNameActivity);

    return List.generate(tasks.length, (index) {
      return ActivityModel(
          activityID: tasks[index][columnActivityID],
          activityName: tasks[index][columnActivityName],
          activityDate: tasks[index][columnActivityDate]);
    });
  }
}
