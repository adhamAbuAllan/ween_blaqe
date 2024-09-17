import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'get_data_from_api.dart';
import 'widget_that_show_data.dart';

main(){
  Get.put(GetDataTest());
  runApp( const OwnM());
}
class OwnM extends StatelessWidget {
  const OwnM({super.key});
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(

      home: HereShouldDataToShow(),);
  }
}
