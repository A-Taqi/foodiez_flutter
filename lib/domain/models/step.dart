class RecipeStep {
  final String step;

  RecipeStep({
    required this.step,
  });

  factory RecipeStep.fromJson(Map<String, dynamic> json) {
    return RecipeStep(
      step: json['step'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'step': step,
    };
  }
}