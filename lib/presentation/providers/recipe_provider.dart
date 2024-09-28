import 'package:flutter/material.dart';
import 'package:foodiez_flutter/domain/models/recipe.dart';
import 'package:foodiez_flutter/data/services/recipe_service.dart';

class RecipeProvider extends ChangeNotifier {
  List<Recipe> recipes = [];
  List<Recipe> userRecipes = []; // Store user-specific recipes
  List<Recipe> filteredRecipes = []; // Holds the filtered recipes
  Recipe? recipe; // Holds a single recipe
  bool isLoading = false; // Track loading state

  final RecipeService _recipeService = RecipeService();

  // Fetch all recipes
  Future<void> getRecipes() async {
    isLoading = true;
    notifyListeners();
    recipes = await _recipeService.getRecipes();
    filteredRecipes = recipes; // Initially, all recipes are shown
    isLoading = false;
    notifyListeners();
  }

  // Fetch a single recipe by ID
  Future<void> getRecipeById(String id) async {
    isLoading = true;
    notifyListeners();
    recipe = await _recipeService.getRecipeById(id);
    isLoading = false;
    notifyListeners();
  }

  // Filter recipes by category
  void filterRecipes(String selectedCategory) {
    if (selectedCategory == 'All') {
      filteredRecipes = recipes; // Show all recipes if "All" is selected
    } else {
      filteredRecipes = recipes.where((recipe) {
        return recipe.category.categoryName == selectedCategory;
      }).toList();
    }
    notifyListeners();
  }

  // Fetch user-specific recipes using token for authentication
  Future<void> getUserRecipes(String token) async {
    isLoading = true;
    notifyListeners();
    userRecipes = await _recipeService.getUserRecipes(token);
    isLoading = false;
    notifyListeners();
  }

  // Add recipe method with image support
  Future<bool> addRecipe(
    String token,
    String title,
    String category,
    String cookTime,
    String prepTime,
    List<String> ingredients,
    List<String> steps,
    dynamic image, // Can be a URL or File
  ) async {
    try {
      final success = await _recipeService.addRecipe(
        token,
        title,
        category,
        cookTime,
        prepTime,
        ingredients,
        steps,
        image, // Pass the image to the service
      );
      return success;
    } catch (e) {
      print("Error adding recipe: $e");
      return false;
    }
  }
}
