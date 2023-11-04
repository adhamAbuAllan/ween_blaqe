import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    home: _Home(),
  ));
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //I don't know what [NotificationListener] widget mean 
      body: NotificationListener<ScrollNotification>(
          onNotification: (notificatoin) {
            debugPrint("ScrollNotification : $notificatoin");
            return true;
          },
          child: Center(
            child: Container(
              alignment: Alignment.center,
              width: 200,
              height: 100,
              color: Colors.amber,
              child: const Text(
                "check your DEBUG CONSOLE ",
                textAlign: TextAlign.center,
              ),
            ),
          )),
    );
  }
}

class _MyNotification extends Notification {}

class _RaisedButton extends StatelessWidget {
  const _RaisedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text("Opatoin A"),
          onPressed: () {
            _MyNotification().dispatch(context);
          },
        ),
      ),
    );
  }
}
