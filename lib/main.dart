import 'package:coinapp/page/coin_responsitory.dart';
import 'package:coinapp/page/favorite_page.dart';
import 'package:coinapp/page/searchcoin_page.dart';
import 'package:coinapp/page/top100coin_page.dart';
import 'package:coinapp/page/top5coin_page.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  CoinResponsitory coinResponsitory = CoinResponsitory();
  await coinResponsitory.initDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coin',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;
  final listTitle = const [
    'List 100 coin top',
    'List 5 coin top',
    'Search coin',
    'Favorite',
  ];
  final ListWidgetHome = [
    Top100Coin_Page(),
    Top5Coin_Page(),
    SearchCoin_Page(),
    Favorite_Page(),
  ];
  void onTapButton(int indexItem){
    setState(() {
      index = indexItem;

      //_counter++;
    });
  }

  void _incrementCounter() {
    setState(() {

      //_counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Center(child: Text(listTitle[index]))
      ),
      body: Center(
        child: ListWidgetHome[index]
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Top 100',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.align_vertical_top,),
            label: 'Top 5',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search,),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite,),
            label: 'Favorite',
          ),
        ],
        currentIndex: index,
        selectedIconTheme: const IconThemeData(color: Colors.orange,),
        unselectedIconTheme: const IconThemeData(color: Colors.black,),
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        onTap: onTapButton,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
