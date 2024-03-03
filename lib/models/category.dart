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
  CategoryMap(){
    var mapping = Map<String,dynamic>();
    mapping['id']=id;
    mapping['name']=name;
    mapping['description']=description;

    return mapping;
  }
}
