import 'package:coinapp/model/chart_model.dart';
import 'package:coinapp/model/coin__model.dart';
import 'package:coinapp/page/coin_responsitory.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class Details_Page extends StatefulWidget {
  Details_Page(this.item,{Key? key}) : super(key: key);
  Coin_Model? item;

  @override
  _Details_PageState createState() => _Details_PageState();
}

class _Details_PageState extends State<Details_Page> {
  List<charts.Series<ChartModel, DateTime>> historyCoin = List.empty();
  bool isFavoriteCheck = false;
  CoinResponsitory coinResponsitory = CoinResponsitory();
  int type = 0;

  @override
  void initState(){
    super.initState();
    syncData();
  }

  @override
  void syncData() async{
    coinResponsitory.checkFavorite(widget.item).then((isFavorite){
      isFavoriteCheck = isFavorite;
      syncHistory(1);
    });
  }
  void syncHistory(int hours) async{
    type = hours;
    historyCoin = await coinResponsitory.getChart(widget.item?.id ?? '', hours);
    setState(() {

    });
  }

  void clickFavourite(){
    coinResponsitory.checkFavorite(widget.item).then((isFavorite){
      if(isFavorite){
        coinResponsitory.removeFavorite(widget.item);
        setState(() {
          isFavoriteCheck = false;
        });
      }else {
        coinResponsitory.addFavorite(widget.item);
        setState(() {
          isFavoriteCheck = true;
        });
    }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.item?.name ?? '',style: TextStyle (fontSize: 30),),
            IconButton(onPressed: () => clickFavourite(), icon: Icon(isFavoriteCheck ? Icons.favorite:Icons.favorite_border,size: 30,)),
            Expanded(
              child: Center(
                child: new charts.TimeSeriesChart(
                  historyCoin,
                  animate: true,
                  dateTimeFactory: const charts.LocalDateTimeFactory(),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () =>syncHistory(4), child: Text('4h',style: TextStyle(color: type == 4 ? Colors.red : Colors.black),)),
                TextButton(onPressed: () =>syncHistory(12), child: Text('12h',style: TextStyle(color: type == 12 ? Colors.red : Colors.black),)),
                TextButton(onPressed: () =>syncHistory(24), child: Text('24h',style: TextStyle(color: type == 24 ? Colors.red : Colors.black),)),
                TextButton(onPressed: () =>syncHistory(1000), child: Text('1000h',style: TextStyle(color: type == 1000 ? Colors.red : Colors.black),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
