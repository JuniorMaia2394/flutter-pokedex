import 'dart:convert';

class Pokemon {
  final String name;
  final String image;
  final List<String> type;
  final int id;
  final String num;

  Pokemon({
    required this.name,
    required this.image,
    required this.type,
    required this.num,
    required this.id,
  });

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      image: json['img'],
      id: json['id'],
      num: json['num'],
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }
}
