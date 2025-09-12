class AdvantageRes {
  AdvantageRes({
    this.status,
    this.msg,
    this.data,
  });

  final bool? status;
  final String? msg;
  final Advantages? data;

  AdvantageRes.fromJson(Map<String, dynamic> json)
      : status = json['status'],
        msg = json['msg'],
        data = json['data'] == null ? null : Advantages.fromJson(json['data']);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['data'] = data == null ? null : data?.toJson();
    return _data;
  }

  AdvantageRes copyWith({
    bool? status,
    String? msg,
    Advantages? data,
  }) {
    return AdvantageRes(
      status: status ?? this.status,
      msg: msg ?? this.msg,
      data: data ?? this.data,
    );
  }
}

class Advantages {
  Advantages({
    this.id,
    this.advName,
    this.icon,
    this.checked = false,
    this.createdAt,
    this.updatedAt,
  });

  final int? id;
  final String? icon;
  final String? advName;
  final String? createdAt;
  final String? updatedAt;
  bool? checked;

  Advantages.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        advName = json['adv_name'],
        icon = json['icon'],
        createdAt = json['created_at'],
        updatedAt = json['updated_at'],
        checked = false; // Default to false if not specified

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['icon'] = icon;
    _data['adv_name'] = advName;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }

  Advantages copyWith({
    int? id,
    String? icon,
    String? advName,
    bool? checked,
    String? createdAt,
    String? updatedAt,
  }) {
    return Advantages(
      id: id ?? this.id,
      icon: icon ?? this.icon,
      advName: advName ?? this.advName,
      checked: checked ?? this.checked,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
