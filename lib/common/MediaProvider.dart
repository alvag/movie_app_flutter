import 'dart:async';
import 'package:movie_app_flutter/common/HttpHandler.dart';
import 'package:movie_app_flutter/models/Media.dart';

abstract class MediaProvider {
  Future<List<Media>> fetchMedia(String category);
}

class MovieProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();

  @override
  Future<List<Media>> fetchMedia(String category) {
    return _client.fetchMovies(category: category);
  }
}

class ShowProvider extends MediaProvider {
  HttpHandler _client = HttpHandler.get();
  @override
  Future<List<Media>> fetchMedia(String category) {
    return _client.fetchShow(category: category);
  }
}
