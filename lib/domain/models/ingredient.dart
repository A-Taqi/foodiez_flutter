class Ingredient {
  final String ingredient;

  Ingredient({
    required this.ingredient,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      ingredient: json['ingredient'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ingredient': ingredient,
    };
  }
}