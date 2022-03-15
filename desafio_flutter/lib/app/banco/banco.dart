import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class BancoService extends GetxService {
  static final BancoService? _instance = BancoService.internal();
  factory BancoService() => _instance!;
  BancoService.internal();
  Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await initDb();
      return _db!;
    }
  }

  Future<Database> initDb() async {
    final dataBasesPath = await getDatabasesPath();
    final path = join(dataBasesPath, "dbdesafio.db");
    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute("CREATE TABLE usuarios("
          "codigo INTEGER PRIMARY KEY,"
          "nome TEXT,"
          "cpf TEXT,"
          "endereco TEXT,"
          "telefone TEXT) ");
    });
  }
}
