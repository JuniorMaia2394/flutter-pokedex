class Pokedex {
  final int id;
  final String base;

  Pokedex({
    required this.id,
    required this.base,
  });

  factory Pokedex.fromMap(Map<String, dynamic> json) {
    return Pokedex(
      id: json['id'],
      base: json['base'],
    );
  }
}
