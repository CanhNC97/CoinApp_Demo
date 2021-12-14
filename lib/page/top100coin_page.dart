import 'package:coinapp/model/coin__model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:coinapp/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'coin_responsitory.dart';
import 'widget/widget_item.dart';

class Top100Coin_Page extends StatefulWidget {
  const Top100Coin_Page({Key? key}) : super(key: key);

  @override
  _Top100Coin_PageState createState() => _Top100Coin_PageState();
}

class _Top100Coin_PageState extends State<Top100Coin_Page> {
  CoinResponsitory coinResponsitory = CoinResponsitory();

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    await coinResponsitory.getData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, index) {
        return WidgetItemList(CoinResponsitory.listCoinModel[index],);
      },
      itemCount: CoinResponsitory.listCoinModel.length,
    );
  }
}

