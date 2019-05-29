import 'package:flutter/material.dart';
import 'package:movie_app_flutter/models/Media.dart';

class MediaListItem extends StatelessWidget {

    final Media media;

    MediaListItem(this.media);

    @override
    Widget build(BuildContext context) {
        return new Card(
            child: Column(
                children: <Widget>[
                    FadeInImage.assetNetwork(
                        placeholder: 'assets/images/film-poster-placeholder.png',
                        image: media.getBackDropUrl(),
                        fit: BoxFit.cover,
                        fadeInDuration: Duration(milliseconds: 40),
                        width: double.infinity,
                        height: 200,
                    )
                ],
            ),
        );
    }
}
