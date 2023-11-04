import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(
    home: _Home(

    ),
  ));
}

class _Home extends StatefulWidget {
  const _Home();

  @override
  State<_Home> createState() => _HomeState();
}

class _HomeState extends State<_Home> {
  Future<String> getData() async {
    await Future.delayed(const Duration(seconds: 1));
    // throw' Error';
    return 'Data!';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
              if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return  Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(snapshot.data.toString()),
                  ElevatedButton(onPressed: (){
                    setState(() {
getData();
                    });
                  }, child: const Text("Refresh"))
                ],
              );
            }
          }, future: null,
        ),
      ),
    );
  }
}
