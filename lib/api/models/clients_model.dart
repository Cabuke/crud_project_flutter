class ClientsModel {
  final String id;
  final String name;
  final String email;
  final String tag;

  ClientsModel({
    required this.id,
    required this.name,
    required this.email,
    required this.tag,
  });

  factory ClientsModel.fromJson(Map<String, dynamic> json) {
    return ClientsModel(
      id: json['_id'].toString(),
      name: json['name'],
      email: json['email'],
      tag: json['tags'],
    );
  }
}
