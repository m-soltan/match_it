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
      body: ListView.builder(
        itemCount: _itemCount,
        itemBuilder: (context, index) {
          dynamic i = _items[index];
          return ListTile(
            title: Text(i._s),
          );
        },
      ),
    );
  }
}
