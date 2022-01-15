import 'package:flutter/material.dart';

import 'calendar_screen.dart';
import 'camera_screen.dart';
import 'flashcards_screen.dart';

class DefinitionScreen extends StatelessWidget {
  final String title;

  DefinitionScreen(this.title);

  @override
  Widget build(context) {
    var lines = <String> [
      "Lorem ipsum dolor sit amet, consectetur",
      "adipiscing elit, sed do eiusmod tempor",
      "incididunt ut labore et dolore magna",
      "aliqua. Ut enim ad minim veniam, quis",
      "nostrud exercitation ullamco laboris nisi",
      "ut aliquip ex ea commodo consequat.",
    ];
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text(title),
      ),
      body: Column(
        children: <Widget> [
          Container(
            color: Colors.black,
            height: 200,
            width: double.infinity,
            child: Icon(
              Icons.play_circle,
              color: Colors.white,
              size: 56,
            ),
          ),
          Container(
            child: Text(
              title + " (12.06.2021)",
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Container(color: Colors.black, height: 8),
          Text(
            "Opis",
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            lines.join("\n"),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.camera_alt,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).push(
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return CameraScreen();
              },
              transitionsBuilder: _transitionsBuilder,
            )
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            Container(height: 48, width: 12),
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return FlashcardsScreen();
                    },
                    transitionsBuilder: _transitionsBuilder,
                  ),
                );
              },
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.calendar_today),
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return CalendarScreen();
                    },
                    transitionsBuilder: _transitionsBuilder,
                  ),
                );
              },
            ),
            Container(height: 48, width: 12),
          ],
        ),
      ),
    );
  }
  SlideTransition _transitionsBuilder(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child
  ) {

    // change the begin offset to slide in from a different direction
    var tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero);
    return SlideTransition(
      position: animation.drive(
        tween.chain(CurveTween(curve: Curves.ease)),
      ),
      child: child,
    );
  }
}
