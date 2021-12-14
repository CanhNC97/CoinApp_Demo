// dao/coin_dao.dart

import 'package:coinapp/model/coin__model.dart';
import 'package:floor/floor.dart';

@dao
abstract class CoinDao {
  @Query('SELECT * FROM Coin_Model')
  Future<List<Coin_Model>> findAllCoin();

  @Query('SELECT * FROM Coin_Model WHERE id = :id')
  Future<Coin_Model?> findCoinById(String id);

  @Query('DELETE * FROM Coin_Model WHERE id = :id')
  Future<Coin_Model?> deleteCoin(int id);

  @insert
  Future<void> insertCoin(Coin_Model coinModel);

  @delete
  Future<void> removeCoin(Coin_Model coinModel);
}