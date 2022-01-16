import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'calendar_screen.dart';
import 'definition_screen.dart';
import 'flashcards_screen.dart';
import 'list_screen.dart';

class _Item {
  final String _s;
  _Item(this._s);
}

var _items = <dynamic>[
  _Item("Banan"),
  _Item("Berło"),
  _Item("Bocian"),
  _Item("Całka"),
  _Item("Ciasto"),
  _Item("Coś"),
  _Item("Dodatkowy"),
  _Item("Dopisać"),
];

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Szukaj...',
                border: InputBorder.none),
          ),
        ),
      )),
    );
  }
}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Lista definicji"),
//         actions: <Widget>[],
//       ),
//       body: Scrollbar(
//         isAlwaysShown: true,
//         child: ListView.separated(
//           itemCount: _items.length,
//           separatorBuilder: (context, index) => Divider(),
//           itemBuilder: (context, index) {
//             dynamic i = _items[index];
//             return ListTile(
//               leading: Container(
//                 height: 56,
//                 width: 56,
//               ),
//               title: Text(i._s),
//               onTap: () {
//                 Navigator.of(context).push(
//                   PageRouteBuilder(
//                     pageBuilder: (context, animation, secondaryAnimation) {
//                       return DefinitionScreen(i._s);
//                     },
//                     transitionsBuilder: _transitionsBuilder,
//                   ),
//                 );
//               },
//               trailing: InkWell(
//                 onTap: () async {
//                   var choice = await showCupertinoModalPopup<Function>(
//                     context: context,
//                     builder: (_) => _ItemModal(),
//                   );
//                   choice?.call();
//                 },
//                 child: Container(
//                   height: 56,
//                   width: 32,
//                   child: Icon(
//                     Icons.more_vert,
//                     color: Theme.of(context).textTheme.bodyText2!.color,
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         child: Icon(
//           Icons.camera_alt,
//           color: Colors.black,
//         ),
//         onPressed: () {
//           ImagePicker().pickImage(source: ImageSource.camera);
//         },
//       ),
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         child: Row(
//           children: <Widget>[
//             Container(height: 48, width: 12),
//             IconButton(
//               icon: Icon(Icons.list),
//               onPressed: () {
//                 Navigator.of(context).push(
//                   PageRouteBuilder(
//                     pageBuilder: (context, animation, secondaryAnimation) {
//                       return FlashcardsScreen();
//                     },
//                     transitionsBuilder: _transitionsBuilder,
//                   ),
//                 );
//               },
//             ),
//             Spacer(),
//             IconButton(
//               icon: Icon(Icons.calendar_today),
//               onPressed: () {
//                 Navigator.of(context).push(
//                   PageRouteBuilder(
//                     pageBuilder: (context, animation, secondaryAnimation) {
//                       return CalendarScreen();
//                     },
//                     transitionsBuilder: _transitionsBuilder,
//                   ),
//                 );
//               },
//             ),
//             Container(height: 48, width: 12),
//           ],
//         ),
//       ),
//     );
//   }

//   SlideTransition _transitionsBuilder(
//       BuildContext context,
//       Animation<double> animation,
//       Animation<double> secondaryAnimation,
//       Widget child) {
//     // change the begin offset to slide in from a different direction
//     var tween = Tween(begin: Offset(1.0, 0.0), end: Offset.zero);
//     return SlideTransition(
//       position: animation.drive(
//         tween.chain(CurveTween(curve: Curves.ease)),
//       ),
//       child: child,
//     );
//   }
// }

// class _ItemModal extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CupertinoActionSheet(
//       actions: <Widget>[
//         CupertinoActionSheetAction(
//           child: Text("Dodaj do grupy"),
//           onPressed: () {
//             Navigator.of(context).pop(() {});
//           },
//         ),
//         CupertinoActionSheetAction(
//           child: Text("Udostępnij"),
//           onPressed: () {
//             Navigator.of(context).pop(() {});
//           },
//         ),
//         CupertinoActionSheetAction(
//           child: Text("Usuń"),
//           isDestructiveAction: true,
//           onPressed: () {
//             Navigator.of(context).pop(() {});
//           },
//         ),
//       ],
//     );
//   }
// }
