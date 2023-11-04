import 'package:flutter/material.dart';

main() {
  runApp( const MaterialApp(
    home: _Home(),
  ));
}
class _Home extends StatefulWidget {
   const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
   bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: _CheckBoxListTile(
        title: "add list check",
        icon: Icons.add,
        isCheck: isCheck,

      onChanged: (value){
          setState(() {
            isCheck = value!;

          });
      },)),
    );
  }
}

class _CheckBoxListTile extends StatefulWidget {
  const _CheckBoxListTile(
      {required this.title,
      required this.icon,
      required this.isCheck,
      this.onChanged});

  final String title;
  final IconData icon;
 final bool? isCheck;
  final ValueChanged<bool?>? onChanged;

  @override
  State<_CheckBoxListTile> createState() => _CheckBoxListTileState();
}

class _CheckBoxListTileState extends State<_CheckBoxListTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(widget.title),
      value: widget.isCheck,
      secondary: Icon(widget.icon),
      onChanged: widget.onChanged,
      controlAffinity: ListTileControlAffinity.platform,
    );
  }
}
