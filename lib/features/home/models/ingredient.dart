class Ingredient {
  final String name;

  const Ingredient({required this.name});

  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(name: json['name']);
  }
}
