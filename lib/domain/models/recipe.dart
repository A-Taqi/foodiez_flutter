import 'package:foodiez_flutter/domain/models/category.dart';
import 'package:foodiez_flutter/domain/models/ingredient.dart';
import 'package:foodiez_flutter/domain/models/step.dart';
import 'package:foodiez_flutter/domain/models/time.dart';

class Recipe {
  final String id;
  final String title;
  final String image;
  final Category category; // Single category
  final Time? cookTime;
  final Time? prepTime;
  final List<Ingredient>? ingredients;
  final List<RecipeStep>? steps;
  final String? user;

  // Constructor
  Recipe({
    required this.id,
    required this.title,
    required this.image,
    required this.category,  // Single category
    this.cookTime,
    this.prepTime,
    this.ingredients,
    this.steps,
    this.user,
  });

  // Factory method to create a Recipe from a map (typically from JSON)
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['_id'] ?? '',
      title: json['title'] ?? '',
      image: json['image'] ?? '',
      category: Category.fromJson(json['category'][0]), // Assuming category is an array with one element
      cookTime: json['cookTime'] != null ? Time.fromJson(json['cookTime']) : null,
      prepTime: json['prepTime'] != null ? Time.fromJson(json['prepTime']) : null,
      ingredients: json['ingredients'] != null
          ? (json['ingredients'] as List).map((e) => Ingredient.fromJson(e)).toList()
          : null,
      steps: json['steps'] != null
          ? (json['steps'] as List).map((e) => RecipeStep.fromJson(e)).toList()
          : null,
      user: json['user'] ?? '',
    );
  }

  // Method to convert a Recipe to a map (typically for JSON serialization)
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'image': image,
      'category': [category.toJson()], // Ensure it's converted as a list
      'cookTime': cookTime?.toJson(),
      'prepTime': prepTime?.toJson(),
      'ingredients': ingredients?.map((x) => x.toJson()).toList(),
      'steps': steps?.map((x) => x.toJson()).toList(),
      'user': user,
    };
  }
}
