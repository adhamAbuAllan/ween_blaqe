import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class CallbackShortcutsHome extends StatefulWidget {
  const CallbackShortcutsHome({super.key});

  @override
  State<CallbackShortcutsHome> createState() => _CallbackShortcutsHomeState();
}

class _CallbackShortcutsHomeState extends State<CallbackShortcutsHome> {
  var count = 0;
  ShortcutActivator activator =  CharacterActivator(
      '+',control: true

  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: CallbackShortcuts(
        bindings:<ShortcutActivator,VoidCallback> {
          activator:(){
            setState(() {
              count = count + 1;
            });
          }
        },
        child: Focus(child: Text("Counter : $count"),)),);
  }
}
