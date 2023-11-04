import 'package:flutter/material.dart';
import 'package:ween_blaqe/i_well_delete_it/practice_flutter_from_flutter_channel/flutter_package_of_the_week/url_launcher/url_launcher_home.dart';
void main(){
  runApp(_MyApp());
}
class _MyApp extends StatelessWidget {
  const _MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: UrlLauncherHome(),);
  }
}