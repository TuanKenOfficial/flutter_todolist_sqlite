class Category {
  late int id;
  late String name;
  late String description;


  Map<String, dynamic> toMap() {
    var mapping = <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
    };
    return mapping;
  }
}
