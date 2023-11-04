import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(home: _Home()));
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  final List<bool> _selection = List.generate(3, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Column(
              // mainAxisSize: ,
              // crossAxisAlignment: CrossAxisAlignment.baseline,

              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Spacer(
                  flex: 12,
                ),
                Text("0"),
                Spacer(),
                Text("1"),
                Spacer(),
                Text("2"),
                Spacer(
                  flex: 12,
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            ToggleButtons(
              isSelected: _selection,
              color: Colors.grey,
              selectedColor: Colors.orange,
              direction: Axis.vertical,
              // tapTargetSize:MaterialTapTargetSize.shrinkWrap,
              textStyle: const TextStyle(fontFamily: "IBM"),
              // fillColor: Colors.white10,
              // disabledColor: Colors.grey[300],
              splashColor: Colors.black26,
              // highlightColor: Colors.cyan,
              selectedBorderColor: Colors.orange,
              // renderBorder: false,
              borderRadius: BorderRadius.circular(7),
              borderWidth: 1,
              borderColor: Colors.orange.shade100,
              onPressed: (index) {
                setState(() {
                  _selection[index] = !_selection[index];
                });
              },
              children: const [
                Icon(Icons.local_cafe),
                Icon(Icons.fastfood),
                Icon(Icons.cake),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
