import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// this is for Activity Table
final String tablePerson = "tblPerson";
final String personID = "id";
final String personName = "name";
final String personBio = "bio";
final String personfavoritePL = "favorite_programminglanguage";
final String personTellMeMore = "tell_more";

class PersonModel {
  int pId;
  final String pName;
  final String pBio;

  final String pFavoritePL;
  final String pTellMeMore;

  PersonModel(
      {this.pId, this.pName, this.pBio, this.pFavoritePL, this.pTellMeMore});

  Map<String, dynamic> toMap() {
    return {
      personName: this.pName,
      personBio: this.pBio,
      personfavoritePL: this.pFavoritePL,
      personTellMeMore: this.pTellMeMore
    };
  }

  String toText() {
    return ("{$pId,$pName,$pBio,$pFavoritePL,$pTellMeMore}");
  }
}

class PersonHelper {
  Database database;

  PersonHelper() {
    initDatabase();
  }

  Future<void> initDatabase() async {
    database = await openDatabase(join(await getDatabasesPath(), "databse.db"),
        onCreate: (db, version) {
      return db.execute('''
      CREATE TABLE $tablePerson ($personID INTEGER PRIMARY KEY AUTOINCREMENT,
          $personName TEXT,
          $personBio TEXT,
          $personfavoritePL TEXT,
          $personTellMeMore TEXT);
      
      INSERT INTO $tablePerson($personID, $personName, $personBio, $personfavoritePL, $personTellMeMore) VALUES (2344,"none","n","n","n");
     
               
      ''');
    }, version: 1);
  }

  Future<void> insertPersonDetails(PersonModel task) async {
    try {
      database.insert(tablePerson, task.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (_) {
      print(_);
    }
  }

  Future<void> updatePersonDetails(PersonModel task) async {
    try {
      database.update(tablePerson, task.toMap(),
          where: '$personID= ?',
          whereArgs: [task.pId],
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (_) {
      print(_);
    }
  }

  Future<List<PersonModel>> getAllPersonDetails() async {
    final Database db = await database;

    final List<Map<String, dynamic>> tasks = await db.query(tablePerson);

    return List.generate(tasks.length, (index) {
      return PersonModel(
          pId: tasks[index][personID],
          pName: tasks[index][personName],
          pBio: tasks[index][personBio],
          pFavoritePL: tasks[index][personfavoritePL],
          pTellMeMore: tasks[index][personTellMeMore]);
    });
  }
}
// i don't know what to add
// add of I don't know what to do
