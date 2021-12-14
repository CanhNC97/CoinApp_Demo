// database.dart

// required package imports
import 'dart:async';
import 'package:coinapp/model/coin__model.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'coin_dao.dart';
part 'database.g.dart'; // the generated code will be there

@Database(version: 1, entities: [Coin_Model])
abstract class AppDatabase extends FloorDatabase {
  CoinDao get coinDao;
}