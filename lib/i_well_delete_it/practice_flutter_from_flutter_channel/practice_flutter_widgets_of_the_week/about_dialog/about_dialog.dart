import 'package:flutter/material.dart';

main() {
  runApp(const MaterialApp(
    home: _Home(),
  ));
}

class _Home extends StatelessWidget {
  const _Home();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _AboutDialog());
  }
}

class _AboutDialog extends StatefulWidget {
  const _AboutDialog();

  @override
  State<_AboutDialog> createState() => _AboutDialogState();
}

class _AboutDialogState extends State<_AboutDialog> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      child: const Text("show about digalog"),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => const AboutDialog(

              applicationIcon: FlutterLogo(
                size: 30,
              ),

              applicationLegalese: "blah blah",
              applicationName: "my about dialog app",
              applicationVersion: '.5',
              children: [
              ]),
        );
      },
    ));
  }
}


