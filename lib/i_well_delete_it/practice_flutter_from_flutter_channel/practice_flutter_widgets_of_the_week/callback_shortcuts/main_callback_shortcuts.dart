 import 'package:flutter/material.dart';

import 'callback_shortcuts_home.dart';
void main() {
   runApp(_MyApp());
}
class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: CallbackShortcutsHome(),);
  }
}
