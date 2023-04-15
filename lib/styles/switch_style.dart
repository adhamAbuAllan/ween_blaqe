import 'package:flutter/material.dart';
// class MatiralOfSwitch extends StatelessWidget {
//   const MatiralOfSwitch({Key? key}) : super(key: key);
  @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: OwnSwitch(),
  //   );
  // }
// }
class OwnSwitch extends StatefulWidget {
  const OwnSwitch({super.key});
  @override
  State<OwnSwitch> createState() => _OwnSwitchState();
}
class _OwnSwitchState extends State<OwnSwitch> {
  bool light0 = true;
  bool light1 = true;
  bool light2 = true;
  final MaterialStateProperty<Icon?> thumbIcon =
  MaterialStateProperty.resolveWith<Icon?>(
        (Set<MaterialState> states) {
      // Thumb icon when the switch is selected.
      if (states.contains(MaterialState.selected)) {
        return const Icon(Icons.check);
      }
      return const Icon(Icons.close);
    },
  );
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Switch(
          activeColor: Colors.orange,
          thumbIcon: thumbIcon,
          value: light1,
          onChanged: (bool value) {
            setState(() {
              light1 = value;
            });
          },
        ),
      ],
    );
  }
}
