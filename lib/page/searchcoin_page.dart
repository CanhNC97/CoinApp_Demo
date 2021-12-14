import 'package:flutter/cupertino.dart';
import 'package:coinapp/model/coin__model.dart';
import 'package:coinapp/page/coin_responsitory.dart';
import 'package:coinapp/page/widget/widget_item.dart';
import 'package:flutter/material.dart';


class SearchCoin_Page extends StatefulWidget {
  const SearchCoin_Page({Key? key}) : super(key: key);

  @override
  _SearchCoin_PageState createState() => _SearchCoin_PageState();
}

class _SearchCoin_PageState extends State<SearchCoin_Page> {
  List<Coin_Model> listTopAll = List.empty();
  List<Coin_Model> listSearch = List.empty();

  @override
  void initState(){
    super.initState();
    listTopAll = CoinResponsitory.listCoinModel;
    listSearch = listTopAll;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            onChanged: (text){
              listSearch = listTopAll.where((element) => element.name?.toLowerCase().contains(text) == true).toList();
              setState(() {

              });
            },
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, index) {
                return WidgetItemList(listSearch[index],);
              },
              itemCount: listSearch.length,
            ),
          ),
        ],
      ),
    );
  }
}
