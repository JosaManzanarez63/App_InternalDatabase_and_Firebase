import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:practice_1/models/shopping_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';


class DatabaseShopping {
  DatabaseShopping._privateConstructor();
  static final DatabaseShopping instance = DatabaseShopping._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'shopping.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async{
    await db.execute(
      '''
      CREATE TABLE products (
        id INTEGER PRIMARY KEY,
        nombre TEXT,
        costo REAL,
        total REAL,
        imagen TEXT,
        cantidad INTEGER
      )
      '''
    );
  }

  Future<int> add(Product cat) async{
    Database db = await instance.database;
    return await db.insert("products", cat.toMap());
  }

  Future<int>delete(int id) async {
    Database db = await instance.database;
    return await db.delete('products', where: 'id = ?', whereArgs: [id]);
  }

  Future<int>update(Product cat) async{
    Database db = await instance.database;
    return await db.update('products', cat.toMap(), where: 'id=?', whereArgs: [cat.id]);
  }

  Future<List<Product>> getProducts() async{
    Database db = await instance.database;
    var products = await db.query('products', orderBy: 'nombre');

    List<Product> catsList = 
      products.isNotEmpty ? products.map((e) => Product.fromMap(e)).toList() : [];
    return catsList;
  }

  Future<int>deleteAll() async {
    Database db = await instance.database;
    return await db.delete('products', where: null);
  }

  Future calculateTotal() async {
  var dbClient = await database;
  var result = await dbClient.rawQuery("SELECT SUM(price) as Total FROM Cart");
  print(result.toList());
}
}
