import 'package:flutter/material.dart';

Padding customListCollectoin({
    required String name,
    required List<dynamic> list,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 100,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(name,
              style: const TextStyle(fontSize: 20, color: Colors.white70)),
          for (int i = 1; i <= 1; i++)
            Text('$list ',
                style: const TextStyle(fontSize: 18, color: Colors.white70)),
        ],
      ),
    );
  }