import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  //Creacion de instancia para que este disponible de manera global
  static Database _database;
  //Método privado
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database> get database async {
    if (database != null) return _database;

    _database = await initDB();

    return _database;
  }

  //Crear base de datos
  initDB() async {
    //Definir PATH para definir la ubicacion de la base de datos
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, 'ScansDB.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        //Ya esta creada la base de datos
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Scans('
          'id INTEGER PRIMARY KEY,'
          'tipo TEXT,'
          'valor TEXT'
          ')');
    });
  }
}
