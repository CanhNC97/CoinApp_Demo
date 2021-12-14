import 'package:coinapp/model/coin__model.dart';
import 'package:coinapp/page/coin_responsitory.dart';
import 'package:coinapp/page/widget/widget_item.dart';
import 'package:flutter/cupertino.dart';

class Favorite_Page extends StatefulWidget {
  const Favorite_Page({Key? key}) : super(key: key);

  @override
  _Favorite_PageState createState() => _Favorite_PageState();
}

class _Favorite_PageState extends State<Favorite_Page> {
  CoinResponsitory coinResponsitory = CoinResponsitory();

  List<Coin_Model> listCoinFavorite = List.empty();
  @override
  void initState(){
    super.initState();
    coinResponsitory.getAllFavorite().then((value){
      //print('object' + value.toString());
      listCoinFavorite = value;
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return WidgetItemList(listCoinFavorite[index],);
      },
      itemCount: listCoinFavorite.length,
    );
  }
}
