import 'package:flutter/material.dart';

class _Header {
  final String _s;
  _Header(this._s);
}

class _Item {
  final String _s;
  _Item(this._s);
}

int _itemCount = 8;
var _items = <dynamic> [
  _Header("B"),
  _Item("Banan"),
  _Item("Berło"),
  _Item("Bocian"),
  _Header("C"),
  _Item("Całka"),
  _Item("Ciasto"),
  _Item("Coś"),
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
          itemCount: _itemCount,
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
                  onTap: () {},
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
