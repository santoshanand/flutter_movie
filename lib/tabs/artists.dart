import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_movie/models/people.dart';
import 'package:flutter_movie/services/movie_service.dart';
import 'package:transparent_image/transparent_image.dart';

class Artists extends StatelessWidget {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();
  Future<Null> _handleRefresh() async {
    return Future.delayed(const Duration(seconds: 3));
  }

  Widget _hList(BuildContext context) =>
      FutureBuilder<List<People>>(
        future: MovieService.getPeople(context),
        builder: (context, snapsot) {
          if (snapsot.hasData) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              shrinkWrap: true,
              itemCount: snapsot.data.length,
              itemBuilder: (BuildContext context, int index) {
                // return listItem(context, snapsot.data.elementAt(index));
              return Padding(
                padding: EdgeInsets.all(4.0),
                child: GridTile(
                  child: FadeInImage.memoryNetwork(
                    image: snapsot.data[index].profilePath,
                    fit: BoxFit.cover,
                    placeholder: kTransparentImage,
                  ),
                  footer: new Container(
                    child: Text(
                    snapsot.data[index].name,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  )),
                ));
              });
          } else if (snapsot.hasError) {
            return Text('Unable to get movie');
          }
          return Center(child: CircularProgressIndicator());
        },
      );
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(16.0),
      child: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _handleRefresh,
          child: _hList(context)),
    );
  }
}
