import 'package:firebase_core/firebase_core.dart';
import 'package:ween_blaqe/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:ween_blaqe/i_well_delete_it/practice_flutter_from_flutter_channel/flutter_package_of_the_week/firebase_crashlytics/handling_errors.dart';
import 'package:ween_blaqe/i_well_delete_it/practice_flutter_from_flutter_channel/flutter_package_of_the_week/firebase_crashlytics/send_error.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
  SendError();
  HandlingErrors();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: TextButton(
        onPressed: ()=>throw Exception(),
        child: const Text("Throw Test Exceptoin"),
      )),
    );
  }
}
