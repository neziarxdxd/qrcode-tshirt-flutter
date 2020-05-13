final String tableName = "todom";
String columnID = "id";
String columnName = "name";

class TaskModel{
  final String name;
  int id;

  TaskModel({this.name, this.id});

  Map<String, dynamic> toMap(){
    return {
      columnName : this.name
    };
  }
}