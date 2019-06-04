import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/MediaProvider.dart';
import 'package:movie_app_flutter/media_list.dart';
import 'package:movie_app_flutter/models/Media.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final MediaProvider movieProvider = new MovieProvider();
  final MediaProvider showProvider = new ShowProvider();
  PageController _pageController;
  int _page = 0;
  MediaType mediaType = MediaType.movie;

  @override
  void initState() {
    _pageController = new PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Flutter Movie App'),
        actions: <Widget>[
          new IconButton(
              icon: new Icon(Icons.search, color: Colors.white),
              onPressed: () {})
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new DrawerHeader(child: new Material()),
            new ListTile(
                title: new Text('Películas'),
                selected: MediaType.movie == this.mediaType,
                trailing: new Icon(Icons.local_movies),
                onTap: () {
                  _changeMediaType(MediaType.movie);
                  Navigator.of(context).pop();
                }),
            new Divider(
              height: 5,
            ),
            new ListTile(
                title: new Text('Series'),
                selected: MediaType.show == this.mediaType,
                trailing: new Icon(Icons.live_tv),
                onTap: () {
                  _changeMediaType(MediaType.show);
                  Navigator.of(context).pop();
                }),
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
      body: new PageView(
        children: _getMediaList(),
        controller: _pageController,
        onPageChanged: (int index) {
          setState(() {
            _page = index;
          });
        },
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: _getFooterItems(),
        currentIndex: _page,
        onTap: _navigationTapped,
      ),
    );
  }

  List<BottomNavigationBarItem> _getFooterItems() {
    return [
      new BottomNavigationBarItem(
          icon: new Icon(Icons.thumb_up), title: new Text('Populares')),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.update), title: new Text('Proximamente')),
      new BottomNavigationBarItem(
          icon: new Icon(Icons.star), title: new Text('Mejor valoradas'))
    ];
  }

  void _changeMediaType(MediaType mediaType) {
    if (this.mediaType != mediaType) {
      setState(() {
        this.mediaType = mediaType;
      });
    }
  }

  List<Widget> _getMediaList() {
    return (this.mediaType == MediaType.movie
        ? <Widget>[
            new MediaList(movieProvider, 'popular'),
            new MediaList(movieProvider, 'upcoming'),
            new MediaList(movieProvider, 'top_rated')
          ]
        : <Widget>[
            new MediaList(showProvider, 'popular'),
            new MediaList(showProvider, 'on_the_air'),
            new MediaList(showProvider, 'top_rated')
          ]);
  }

  void _navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}
