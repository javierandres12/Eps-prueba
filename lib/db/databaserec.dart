import 'package:eps/model/registroMonitordata.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'dart:async';
import 'package:path/path.dart';

class DataBaseREC{
  static Future<Database> _openDB() async {
    return openDatabase(
      //crear o abrir la base de datos
        join(await getDatabasesPath(), 'core.db'),
        onCreate: (db, version)  async {
          await db.execute(
              "CREATE TABLE registromonitores (id INTEGER PRIMARY KEY, identificacionM1 TEXT, identificacionM2 TEXT, identificacionM3 TEXT, parametroMonitorFijo TEXT, parametroOperacion TEXT, operacionECG TEXT, operacionSP02 TEXT, operacionPSN TEXT, operacionRESP TEXT, largoVector TEXT)");
          await db.execute(
              "CREATE TABLE dominios (id INTEGER PRIMARY KEY, dominio TEXT)");
        }, version: 1);
  }

  static Future<void> guardarRegistroMonitor(RegistroMonitorData registroMonitorData) async{
    Database database = await _openDB();
    return database.insert('registromonitores', registroMonitorData.toMap());
  }

  static MonitorRegistrado(/*identifiacion1,identifiacion2,identifiacion3*/) async{
    Database database = await _openDB();
    final List<Map<String, dynamic>> monitoresRegistradosMap =
    await database.rawQuery('SELECT registromonitores.* FROM registromonitores');
    return monitoresRegistradosMap;
  }

  static BorrarDatos() async{
    Database database = await _openDB();
    await database.delete('registromonitores');
  }


}
