

import 'package:flutter/material.dart';
import 'dart:convert';

import '../urls_of_project/localhost_urls.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      home: TestAdv(),
    );
  }
}

class TestAdv extends StatefulWidget {
  const TestAdv({Key? key}) : super(key: key);
  @override
  State<TestAdv> createState() => _TestAdvState();
}

class _TestAdvState extends State<TestAdv> {
  @override
  void initState() {
    super.initState();
    go();
  }
  String msg = "";
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
  go()async{
    var url = Uri.parse(ServerLocalDiv.advantagesAdd);
    var response = await http.post(url,body:{"adv_name": "apartment",
      // "icon":"assets/images/apartments_images/apartment.jpg"
    });
    var json = jsonDecode(response.body);
    if(response.body.isEmpty){
      print('they body is empty');
    }else{
      print('they body is NotEmpty');

    }
    var res = AdvantageRes.fromJson(json);
    if(res.status==false){
      setState(() {
        msg = res.msg;
        print("status is false : $msg");
      });

    }else{
      setState(() {
        msg = "";
        print("status is true :$msg");
      });
    }
  }

}

// class Advantages{
//   int id;
//   String adv_name;
//   String icon;
//   Advantages({
//   required this.id,
//   required this.adv_name,
//   required this.icon});
// }

class AdvantageRes {
  AdvantageRes({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final bool status;
  late final String msg;
  late final Advantage? data;

  AdvantageRes.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    data = json['data'] == null? null : Advantage?.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['data'] = data == null? null : data?.toJson();
    return _data;
  }
}

class Advantage{
  Advantage({
    required this.id,
    required this.advName,
    required this.icon,
    required this.checkedId,
    this.createdAt,
    this.updatedAt,
  });
  late final int id;
  late final int ?checkedId;
  late final String icon;
  late final String advName;
  late final String? createdAt;
  late final String?updatedAt;

  Advantage.fromJson(Map<String, dynamic> json){
    id = json['id'];
    checkedId = json['checked_id'];
    advName = json['adv_name'];
    icon = json['icon'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['checked_id']= checkedId;
    _data['icon'] = icon;
    _data['adv_name'] = advName;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}