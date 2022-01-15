import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'calendar_screen.dart';

class FlashcardsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        title: Text("Fiszki"),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.camera_alt,
          color: Colors.black,
        ),
        onPressed: () {
          ImagePicker().pickImage(source: ImageSource.camera);
        },
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            Container(height: 48, width: 12),
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
