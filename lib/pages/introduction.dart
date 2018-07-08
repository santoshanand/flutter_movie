import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Introduction extends StatefulWidget {
  @override
  _IntroductionState createState() => _IntroductionState();
}

class _IntroductionState extends State<Introduction> {
  // Intro images
  static var _images = [
    'assets/screens/screen_one.jpg',
    'assets/screens/screen_two.png',
    'assets/screens/screen_three.jpg'
  ];

  final _introTitleAndDescription = Center(
    child: Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Movies & Series',
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.0,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'The world’s most popular and authoritative source for movies and series.',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );

// Explore collection button

  Widget _exploreCollection(context) => Column(
    mainAxisAlignment: MainAxisAlignment.end,
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: Center(
          child: RaisedButton(
            elevation: 0.0,
            padding: EdgeInsets.only(
                left: 60.0, right: 60.0, top: 16.0, bottom: 16.0),
            color: const Color(0x900294A5),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: Text(
              'Explore Collection',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
      ),
    ],
  );

  final _introScreen = Swiper(
    itemBuilder: (BuildContext context, int index) {
      return Image.asset(
        _images[index],
        fit: BoxFit.fill,
      );
    },
    itemCount: 3,
    pagination: new SwiperPagination(
      margin: EdgeInsets.only(bottom: 60.0),
    ),
    onIndexChanged: (int index) {},
  );

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _introScreen,
          _introTitleAndDescription,
          _exploreCollection(context)
        ],
      ),
    );
  }
}
