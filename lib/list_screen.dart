import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class _Header {
  final String _s;
  _Header(this._s);
}

class _Item {
  final String _s;
  _Item(this._s);
}

var _items = <dynamic> [
  _Header("B"),
  _Item("Banan"),
  _Item("Berło"),
  _Item("Bocian"),
  _Header("C"),
  _Item("Całka"),
  _Item("Ciasto"),
  _Item("Coś"),
  _Header("D"),
  _Item("Dodatkowy"),
  _Item("Dopisać"),
];

class ListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista definicji"),
        actions: <Widget>[
          TextButton(
            child: Icon(
              Icons.search,
              color: Theme.of(context).textTheme.bodyText2!.color,
            ),
            onPressed: () {},

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
                  width: 56,
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
          onPressed: () {},
        ),
        CupertinoActionSheetAction(
          child: Text("Udostępnij"),
          onPressed: () {},
        ),
        CupertinoActionSheetAction(
          child: Text("Usuń"),
          isDestructiveAction: true,
          onPressed: () {},
        ),
      ],
    );
  }
}
