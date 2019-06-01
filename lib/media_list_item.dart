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
                    Container(
                        child: Stack(
                            children: <Widget>[
                                FadeInImage.assetNetwork(
                                    placeholder: 'assets/images/film-poster-placeholder.png',
                                    image: media.getBackDropUrl(),
                                    fit: BoxFit.cover,
                                    fadeInDuration: Duration(milliseconds: 40),
                                    width: double.infinity,
                                    height: 200,
                                ),
                                Positioned(
                                    left: 0,
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[900].withOpacity(0.5)
                                        ),
                                        constraints: BoxConstraints.expand(
                                            height: 55
                                        ),
                                    ),
                                ),
                                Positioned(
                                    left: 10,
                                    bottom: 10,
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                            Container(
                                                child: Text(
                                                    media.title,
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white
                                                    ),
                                                ),
                                            ),
                                            Container(
                                                padding: const EdgeInsets.only(top: 4),
                                                child: Text(
                                                    media.getGenresName(),
                                                    style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        color: Colors.white
                                                    ),
                                                    maxLines: 1,
                                                    overflow: TextOverflow.ellipsis,
                                                ),
                                            ),
                                        ],
                                    ),
                                )
                            ],
                        ),
                    ),
                ],
            ),
        );
    }
}
