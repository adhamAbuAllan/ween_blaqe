// import 'dart:convert';
//
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
//
// import 'package:http/http.dart' as http;
// import 'package:ween_blaqe/i_well_delete_it/models/post.dart';
//
// class PostController extends GetXControllerBuilder{
//   List<Post> posts = [];
//   getPosts() async{
// var url = "http://akram.cap.edu.ps/api/post/all";
// var res = await http.post(Uri.parse(url));
// var json = jsonDecode(res.body);
// var model = PostResponse.fromJson(json);
// posts = model.data;
// update();
//   }
//
// }