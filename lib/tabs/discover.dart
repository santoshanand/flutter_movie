import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_movie/models/movie.dart';
import 'package:flutter_movie/services/movie_service.dart';
import 'package:transparent_image/transparent_image.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  Widget _listItem(BuildContext context, Movie movie) => Container(
        width: 136.0,
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FadeInImage.memoryNetwork(
                image: movie.posterPath,
                placeholder: kTransparentImage,
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                movie.title,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(
                height: 6.0,
              ),
              Text(
                movie.releaseDate,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 12.0, color: Colors.black45),
              ),
            ],
          ),
        ),
      );

  Widget _hList(BuildContext context, String type) => FutureBuilder<List<Movie>>(
        // future: MovieService.getMovies(type),
        future: MovieService.getLocalMovies(context, type),
        builder: (context, snapsot) {
          if (snapsot.hasData) {
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: snapsot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return _listItem(context, snapsot.data.elementAt(index));
                });
          } else if (snapsot.hasError) {
            return Text('Unable to get movie');
          }
          return Center(child: CircularProgressIndicator());
        },
      );
  Future<Null> _handleRefresh() async {
    // TODO
    return Future.delayed(const Duration(seconds: 3));
  }

  Widget getLabel(String message) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          message,
          style: TextStyle(fontSize: 18.0),
        ),
        FlatButton(
          child: Text('Show All',
              style: TextStyle(color: Colors.blue), textAlign: TextAlign.right),
          onPressed: () {},
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // return nowPlaying(context);
    return new Padding(
      padding: EdgeInsets.all(16.0),
      child: new RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        child: ListView(
          children: <Widget>[
            getLabel('Top Raited'),
            SizedBox(height: 10.0),
            Container(
              height: 260.0,
              child: _hList(context, 'top_rated'),
            ),
            
            SizedBox(height: 10.0),
            getLabel('Now Playing'),
            SizedBox(height: 10.0),
            Container(
              height: 260.0,
              child: _hList(context, 'now_playing'),
            ),
            SizedBox(height: 10.0),
            getLabel('Coming Soon'),
            SizedBox(height: 10.0),
            Container(
              height: 260.0,
              child: _hList(context, 'upcoming'),
            )
          ],
        ),
      ),
    );
  }
}
