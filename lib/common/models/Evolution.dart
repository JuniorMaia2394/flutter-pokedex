class Evolution {
  String? num;
  String? name;

  Evolution({
    this.num,
    this.name,
  });

  factory Evolution.fromJson(Map<String, dynamic> json) => Evolution(
        num: json['num'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        "num": num == null ? 'Sem evolução' : num,
        "name": name == null ? 'Sem evolução' : name,
      };
}
