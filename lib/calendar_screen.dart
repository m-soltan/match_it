import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'list_screen.dart';
import 'definition_screen.dart';
import 'flashcards_screen.dart';
import 'search_screen.dart';

class _Header {
  final String _s;
  _Header(this._s);
}

class _Item {
  final String _s;
  _Item(this._s);
}

var _items = <dynamic>[
  _Header("14.01.2022"),
  _Item("Ciasto"),
  _Item("Dodatkowy"),
  _Header("12.01.2022"),
  _Item("Całka"),
  _Item("Coś"),
  _Item("Bocian"),
  _Header("9.01.2022"),
  _Item("Banan"),
  _Item("Berło"),
  _Header("4.01.2022"),
  _Item("Dopisać"),
];

class CalendarScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kalendarz"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Theme.of(context).textTheme.bodyText2!.color,
            ),
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) {
                    return SearchScreenStatefulWidget();
                  },
                  transitionsBuilder: _transitionsBuilder,
                ),
              );
            },
          ),
        ],
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        child: ListView.separated(
          itemCount: _items.length,
          separatorBuilder: (context, index) => Divider(),
          itemBuilder: (context, index) {
            dynamic i = _items[index];
            if (i is _Header) {
              return ListTile(
                leading: Container(
                  height: 56,
                  width: 200,
                  child: Center(
                    child: Text(
                      i._s,
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
              );
            } else {
              assert(i is _Item);
              return ListTile(
                leading: Container(
                  height: 56,
                  width: 56,
                ),
                title: Text(i._s),
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return DefinitionScreen(i._s);
                      },
                      transitionsBuilder: _transitionsBuilder,
                    ),
                  );
                },
                trailing: InkWell(
                  onTap: () async {
                    var choice = await showCupertinoModalPopup<Function>(
                      context: context,
                      builder: (_) => _ItemModal(),
                    );
                    choice?.call();
                  },
                  child: Container(
                    height: 56,
                    width: 32,
                    child: Icon(
                      Icons.more_vert,
                      color: Theme.of(context).textTheme.bodyText2!.color,
                    ),
                  ),
                ),
              );
            }
          },
        ),
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
            IconButton(
              icon: Icon(Icons.list),
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) {
                      return ListScreen();
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
      Widget child) {
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

class _ItemModal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text("Dodaj do grupy"),
          onPressed: () {
            Navigator.of(context).pop(() {});
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Udostępnij"),
          onPressed: () {
            Navigator.of(context).pop(() {});
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Usuń"),
          isDestructiveAction: true,
          onPressed: () {
            Navigator.of(context).pop(() {});
          },
        ),
      ],
    );
  }
}
