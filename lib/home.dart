import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/HttpHandler.dart';

class Home extends StatefulWidget {
    @override
    _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

    @override
  void initState() {
    super.initState();
    _loadJson();
  }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                title: new Text('Flutter Movie App'),
                actions: <Widget>[
                    new IconButton(
                        icon: new Icon(Icons.search, color: Colors.white),
                        onPressed: () {}
                    )
                ],
            ),
            drawer: new Drawer(
                child: new ListView(
                    children: <Widget>[
                        new DrawerHeader(child: new Material()),
                        new ListTile(
                            title: new Text('Películas'),
                            trailing: new Icon(Icons.local_movies),
                        ),
                        new Divider(
                            height: 5,
                        ),
                        new ListTile(
                            title: new Text('Series'),
                            trailing: new Icon(Icons.live_tv),
                        ),
                        new Divider(
                            height: 5,
                        ),
                        new ListTile(
                            title: new Text('Cerrar'),
                            trailing: new Icon(Icons.close),
                            onTap: () => Navigator.of(context).pop(),
                        ),
                    ],
                ),
            ),
            bottomNavigationBar: new BottomNavigationBar(
                items: _getFooterItems()
            ),
        );
    }

    List<BottomNavigationBarItem> _getFooterItems() {
        return [
            new BottomNavigationBarItem(
                icon: new Icon(Icons.thumb_up),
                title: new Text('Populares')
            ),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.update),
                title: new Text('Proximamente')
            ),
            new BottomNavigationBarItem(
                icon: new Icon(Icons.star),
                title: new Text('Mejor valoradas')
            )
        ];
    }

  void _loadJson() async {
        String data = await HttpHandler().fetchMovies();
        print(data);
  }
}
