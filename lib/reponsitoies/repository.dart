import 'package:todosqliteapp/reponsitoies/database_connection.dart';
import 'package:sqflite/sqflite.dart';


class Repository{
  late DatabaseConnection _databaseConnection;

  //initalize database connection
  Repository(){
   _databaseConnection = DatabaseConnection();
  }

  static Database? _database;

  //check if database is exits or not
  Future<Database?> get database async{
    if(_database != null) return _database;
    _database = await _databaseConnection.setDatabase();
    return _database;
  }
  //inserting data to table
  insertData(table, data) async{
    var connection = await database;
    return await connection?.insert(table, data);
  }
}