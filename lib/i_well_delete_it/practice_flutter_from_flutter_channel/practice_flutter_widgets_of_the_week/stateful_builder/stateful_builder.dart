import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(theme: ThemeData.dark(), home: const _Home()));
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8,vertical: 35),
              child: Text(
                overflow: TextOverflow.visible,
                "In this widget you can setState without use stateful class for any stateless weiget ",style: TextStyle(color: Colors.red,height: 1.5,fontSize: 18),),
            ),

            StatefulBuilder(builder: (context, setState) {
              return Column(
                children: [
                  _CounterClass(
                    count,
                    () {
                      setState(() => count++);
                    },
                  ),
                ],
              );
            }),
            const SizedBox(
              height: 50,
            ),
            const ElevatedButton(
                onPressed: null, child: Text("Not rebuild widget"))
          ],
        ),
      ),
    );
  }
}

class _CounterClass extends StatelessWidget {
  _CounterClass(this.count, this.onPressed);

  int count;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Container(
          width: 300,
          height: 300,
          decoration:  const BoxDecoration(
              color: Colors.black54, shape: BoxShape.circle),
          child: Center(
            child: Text(count.toString(),
                style: const TextStyle(fontSize: 80, color: Colors.white)),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.add),
            label: const Text("Increase"))
      ],
    );
  }
}
