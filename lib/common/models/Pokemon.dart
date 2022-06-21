import 'package:flutter/material.dart';
import 'package:pokedex_flutter/common/models/Evolution.dart';

class Pokemon {
  final String name;
  final List<String> type;
  final int id;
  final String num;
  final String height;
  final String weight;
  final List<String> weaknesses;
  Evolution? nextEvolution;

  Pokemon({
    required this.name,
    required this.type,
    required this.num,
    required this.id,
    required this.height,
    required this.weight,
    required this.weaknesses,
    this.nextEvolution,
  });

  factory Pokemon.fromMap(Map<String, dynamic> json) {
    return Pokemon(
      name: json['name'],
      id: json['id'],
      num: json['num'],
      height: json['height'],
      weight: json['weight'],
      nextEvolution: json['next_evolution'] == null
          ? null
          : Evolution.fromJson(json["next_evolution"][0]),
      type: (json['type'] as List<dynamic>).map((e) => e as String).toList(),
      weaknesses: (json['weaknesses'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );
  }

  Color? get baseColor => _color(type: type[0]);
  Color? get labelColor => _labelColor(type: type[0]);
  Color? get weaknessesColor => _weaknessesColor(weaknesses: weaknesses[0]);
  String get image =>
      'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png';

  static Color? _color({required String type}) {
    switch (type) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }

  static Color? _labelColor({required String type}) {
    switch (type) {
      case 'Normal':
        return const Color(0xFFF5DEB3);
      case 'Fire':
        return const Color(0xFFFFE4E1);
      case 'Water':
        return const Color(0xFFAFEEEE);
      case 'Grass':
        return const Color.fromARGB(196, 187, 249, 187);
      case 'Electric':
        return const Color(0xFFFFFACD);
      case 'Ice':
        return const Color(0xFFE0FFFF);
      case 'Fighting':
        return const Color.fromARGB(175, 246, 234, 162);
      case 'Poison':
        return const Color(0xFFD8BFD8);
      case 'Ground':
        return const Color(0xFFFFEBCD);
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return const Color(0xFFFFC0CB);
      case 'Bug':
        return const Color(0xFFADFF2F);
      case 'Rock':
        return const Color(0xFFDCDCDC);
      case 'Ghost':
        return const Color.fromARGB(164, 221, 160, 221);
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return const Color(0XFF87CEFA);
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }

  static Color? _weaknessesColor({required String weaknesses}) {
    switch (weaknesses) {
      case 'Normal':
        return Colors.brown[400];
      case 'Fire':
        return Colors.red;
      case 'Water':
        return Colors.blue;
      case 'Grass':
        return Colors.green;
      case 'Electric':
        return Colors.amber;
      case 'Ice':
        return Colors.cyanAccent[400];
      case 'Fighting':
        return Colors.orange;
      case 'Poison':
        return Colors.purple;
      case 'Ground':
        return Colors.orange[300];
      case 'Flying':
        return Colors.indigo[200];
      case 'Psychic':
        return Colors.pink;
      case 'Bug':
        return Colors.lightGreen[500];
      case 'Rock':
        return Colors.grey;
      case 'Ghost':
        return Colors.indigo[400];
      case 'Dark':
        return Colors.brown;
      case 'Dragon':
        return Colors.indigo[800];
      case 'Steel':
        return Colors.blueGrey;
      case 'Fairy':
        return Colors.pinkAccent[100];
      default:
        return Colors.grey;
    }
  }
}
