//
//
// class PostResponse {
//   PostResponse({
//     required this.success,
//     required this.msg,
//     required this.data,
//   });
//   late final bool success;
//   late final String msg;
//   late final List<Post> data;
//
//   PostResponse.fromJson(Map<String, dynamic> json){
//     success = json['success'];
//     msg = json['msg'];
//     data = List.from(json['data']).map((e)=>Post.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['success'] = success;
//     _data['msg'] = msg;
//     _data['data'] = data.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class Post {
//   Post({
//     required this.id,
//     required this.post,
//     required this.image,
//
//   });
//   late final int id;
//   late final String post;
//   late final String image;
//
//
//   Post.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     post = json['post'];
//     image = json['image'];
//
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['post'] = post;
//     _data['image'] = image;
//     return _data;
//   }
// }