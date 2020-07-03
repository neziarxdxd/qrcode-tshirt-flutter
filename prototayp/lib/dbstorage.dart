import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// this is for Activity Table
final String tableNameActivity = "tblActivityTable";
final String columnActivityID = "activityID";
final String columnActivityName = "activityName";
final String columnNumberOfDays = "activityDays";
final String columnActivityIcon = "activityIcon";

final String tableNameDateStamp = "tblDateStamp";
final String columnDateID = "dateID";
final String columnDateStamp = "dateStamp";

class ActivityModel {
  int activityID;
  final String activityName;
  final String activityDate;
  final String activityTime;

  ActivityModel(
      {this.activityID,
      this.activityName,
      this.activityDate,
      this.activityTime});

  Map<String, dynamic> toMap() {
    return {
      columnActivityName: this.activityName,
      columnActivityIcon: this.activityDate,
      columnNumberOfDays: this.activityTime
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
      CREATE TABLE $tableNameActivity ($columnActivityID INTEGER PRIMARY KEY AUTOINCREMENT,
          $columnActivityName TEXT,
          $columnActivityIcon TEXT,
          $columnNumberOfDays TEXT
          );
      CREATE TABLE $tableNameDateStamp ($columnDateID INTEGER PRIMARY KEY AUTOINCREMENT,     
      $columnDateStamp TEXT,
      FOREIGN KEY ($columnActivityID) REFERENCES $tableNameActivity($columnActivityID)
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
          activityDate: tasks[index][columnActivityIcon],
          activityTime: tasks[index][columnNumberOfDays]);
    });
  }
}
