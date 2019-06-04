import 'package:flutter/material.dart';
import 'package:movie_app_flutter/common/MediaProvider.dart';
import 'package:movie_app_flutter/models/Media.dart';
import 'package:movie_app_flutter/media_list_item.dart';

class MediaList extends StatefulWidget {
  final MediaProvider mediaProvider;
  String category;

  MediaList(this.mediaProvider, this.category);

  @override
  _MediaListState createState() => _MediaListState();
}

class _MediaListState extends State<MediaList> {
  List<Media> _media = new List();

  @override
  void initState() {
    super.initState();
    loadMovies();
  }

  @override
  didUpdateWidget(MediaList oldWidget) {
    if (oldWidget.mediaProvider.runtimeType !=
        widget.mediaProvider.runtimeType) {
      _media = new List();
      loadMovies();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new ListView.builder(
        itemCount: _media.length,
        itemBuilder: (BuildContext context, int index) {
          return MediaListItem(_media[index]);
        },
      ),
    );
  }

  void loadMovies() async {
    var movies = await widget.mediaProvider.fetchMedia(widget.category);
    setState(() {
      _media.addAll(movies);
    });
  }
}
