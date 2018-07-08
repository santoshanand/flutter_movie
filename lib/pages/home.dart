import 'package:flutter/material.dart';
import 'package:flutter_movie/tabs/artists.dart';
import 'package:flutter_movie/tabs/discover.dart';
import 'package:flutter_movie/tabs/geners.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController tabController;
  int _index = 0;
  
  List<String> tabString = [
    'Discover',
    'Geners',
    'Artists'
  ];

  String _title = 'Discover';

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 3,
      vsync: this
    );
    this._index = 0;
    setState(() {
      this._title = tabString.first;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){},
          )
        ],
      ),
      body: new Container(
        color: const Color(0xffEEEEEE),
              child: TabBarView(
          children: <Widget>[
            Discover(),
            Geners(),
            Artists()
          ],
          controller: tabController,
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _index,
          onTap: (int _index) {
            setState(() {
              this._title = tabString[_index];
              this._index = _index;
              this.tabController.animateTo(_index);
            });
          },
          items: <BottomNavigationBarItem>[
            new BottomNavigationBarItem(
              icon: new Icon(Icons.dashboard),
              title: new Text("Discover"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.surround_sound),
              title: new Text("Geners"),
            ),
            new BottomNavigationBarItem(
              icon: new Icon(Icons.account_circle),
              title: new Text("Artists"),
            ),
            
          ]),
    );
  }
}