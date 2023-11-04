
  import 'package:flutter/material.dart';

ListView generateCustomListView() {
    return ListView.builder(
      itemCount: 20,
      physics: const BouncingScrollPhysics(),
      itemBuilder: ((context, index) {
        return _listTile(index);
      }),
    );
  }

  ListTile _listTile(int index) {
    return ListTile(
      // hoverColor: Colors.amber,
      shape: Border.all(width: .01, color: Colors.black54),
      focusColor: Colors.black,
      trailing: const Icon(Icons.subdirectory_arrow_right),
      // splashColor: Colors.amber,
      title: Text("Item ${1 + index}"),
    );
  }