import 'package:coinapp/model/coin__model.dart';
import 'package:coinapp/page/coin_responsitory.dart';
import 'package:flutter/cupertino.dart';
import 'package:coinapp/page/widget/widget_item.dart';

class Top5Coin_Page extends StatefulWidget {
  Top5Coin_Page({Key? key}) : super(key: key);

  @override
  _Top5Coin_PageState createState() => _Top5Coin_PageState();
}

class _Top5Coin_PageState extends State<Top5Coin_Page> {
  List<Coin_Model> listTopAll = List.empty();
  List<Coin_Model> listTop5Coin = List.empty();

  @override
  void initState() {
    super.initState();
    listTopAll = CoinResponsitory.listCoinModel;
    listTopAll.sort((a,b) => (b.marketCapChangePercentage24h ?? 0 ).compareTo(a.marketCapChangePercentage24h ?? 0 ));
    listTop5Coin = listTopAll.take(5).toList();
  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return WidgetItemList(listTop5Coin[index],);
      },
      itemCount: listTop5Coin.length,
    );
  }
}
