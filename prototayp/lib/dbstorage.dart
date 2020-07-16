import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// this is for Activity Table
final String tablePerson = "tblPerson";
final String personID = "id";
final String personName = "name";
final String personBio = "bio";
final String personProfession = "profession";
final String personfavoritePL = "favorite_programminglanguage";
final String personTellMeMore = "tell_more";

class PersonModel {
  int pId;
  final String pName;
  final String pBio;
  final String pProfession;
  final String pFavoritePL;
  final String pTellMeMore;

  PersonModel(
      {this.pId,
      this.pName,
      this.pBio,
      this.pProfession,
      this.pFavoritePL,
      this.pTellMeMore});

  Map<String, dynamic> toMap() {
    return {
      personName: this.pName,
      personProfession: this.pProfession,
      personBio: this.pBio,
      personProfession: this.pProfession,
      personfavoritePL: this.pFavoritePL,
      personTellMeMore: this.pTellMeMore
    };
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
          $personProfession TEXT,
          $personBio TEXT,
          $personfavoritePL TEXT,
          $personTellMeMore TEXT

          );
     
               
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

  Future<List<PersonModel>> getAllPersonDetails() async {
    final List<Map<String, dynamic>> tasks = await database.query(tablePerson);

    return List.generate(tasks.length, (index) {
      return PersonModel(
          pId: tasks[index][personID],
          pName: tasks[index][personName],
          pBio: tasks[index][personBio],
          pProfession: tasks[index][personProfession],
          pFavoritePL: tasks[index][personfavoritePL],
          pTellMeMore: tasks[index][personTellMeMore]);
    });
  }
}
