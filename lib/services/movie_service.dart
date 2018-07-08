import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_movie/models/movie.dart';
import 'package:flutter_movie/models/people.dart';

class MovieService {
  static final String _imagePath = 'https://image.tmdb.org/t/p/w300';
  static Future<List<Movie>> getLocalMovies(BuildContext context, String name) async {
    String stringJson = await DefaultAssetBundle.of(context).loadString('assets/data/$name.json');
    return _parseMovies(stringJson, true);
  }
  
  static List<People> _parsePeople(dynamic value) {
    final response = value;
    List<People> list = List<People>();
    final res = json.decode(response);
    List tempRes = res['results'];
    for (int i = 0; i < tempRes.length; i++) {
      final item = tempRes.elementAt(i);
      People movie = new People(
          name: item['name'],
          id: item['id'],
          popularity: item['popularity'],
          profilePath: _imagePath + item['profile_path'].toString());
      list.add(movie);
    }
    return list;
  }
  static Future<List<People>> getPeople(BuildContext context) async {
    String stringJson = await DefaultAssetBundle.of(context).loadString('assets/data/artists.json');
    return _parsePeople(stringJson);
  }

  static List<Movie> _parseMovies(dynamic value, bool isLocal) {
    var response = value;
    List<Movie> movieList = List<Movie>();
    var res;
    if (isLocal) {
      res = json.decode(value);
    }
    else {
      res = json.decode(response.body);
    }
    List tempMovies = res['results'];
    for (int i = 0; i < tempMovies.length; i++) {
      var item = tempMovies.elementAt(i);
      Movie movie = new Movie(
        adult: item['adult'],
        title: item['title'],
        backdropPath: _imagePath + item['backdrop_path'].toString(),
        genreIds: item['genre_ids'],
        id: item['id'],
        originalTitle: item['original_title'],
        overview: item['overview'],
        popularity: item['popularity'],
        posterPath: _imagePath + item['poster_path'].toString(),
        releaseDate: item['release_date'],
        video: item['video'],
        voteAverage: item['vote_average'],
        voteCount: item['vote_count'],
      );
      movieList.add(movie);
    }
    return movieList;
  }

}