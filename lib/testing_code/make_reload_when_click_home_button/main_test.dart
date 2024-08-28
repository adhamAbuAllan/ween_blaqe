
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/student_controller/student_controller.dart';
import 'main_student_test.dart';

main(){
  Get.put(StudentController());
  runApp(const GetMaterialAppTest());
}
class GetMaterialAppTest extends StatelessWidget {
  const GetMaterialAppTest({super.key});

  @override
  Widget build(BuildContext context) {
    return  const GetMaterialApp(home: MainStudentTest());
  }
}

class SecondClassTest extends StatelessWidget {
  const SecondClassTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("SecondClassTest"),);
  }
}
class ThridClassTest extends StatelessWidget {
  const ThridClassTest({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("ThridClassTest"),);
  }
}

