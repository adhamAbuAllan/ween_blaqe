class OwnerType {
  final int? id;
  final String name;

  OwnerType({
    this.id,
    required this.name,
  });

  // Create a list of owner types
  static List<OwnerType> get ownerTypes => [
        OwnerType(id: 1, name: "مالك"),
        OwnerType(id: 2, name: "مكتب عقاري"),
      ];

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  // Create from JSON
  factory OwnerType.fromJson(Map<String, dynamic> json) {
    return OwnerType(
      id: json['id'],
      name: json['name'],
    );
  }
}
