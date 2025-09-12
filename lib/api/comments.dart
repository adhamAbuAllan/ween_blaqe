class CommentRes {
  CommentRes({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final bool status;
  late final String msg;
  late final Comment data;

  CommentRes.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    data = Comment.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Comment {
  Comment({
    required this.comment,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
  late final String comment;
  late final String updatedAt;
  late final String createdAt;
  late final int id;

  Comment.fromJson(Map<String, dynamic> json){
    comment = json['comment'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['comment'] = comment;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['id'] = id;
    return _data;
  }
}