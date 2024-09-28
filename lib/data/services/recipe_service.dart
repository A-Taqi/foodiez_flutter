import 'package:dio/dio.dart';
import 'package:foodiez_flutter/domain/models/recipe.dart';
import 'package:universal_io/io.dart';
import 'package:flutter/foundation.dart'; // To check if the platform is web
import 'package:image_picker/image_picker.dart'; // Import XFile for web handling

class RecipeService {
  final Dio _dio = Dio();
  final _baseUrl = "http://localhost:8001";

  // Fetch all recipes
  Future<List<Recipe>> getRecipes() async {
    List<Recipe> recipes = [];
    try {
      final response = await _dio.get("$_baseUrl/recipes");

      if (response.statusCode == 200) {
        recipes = (response.data as List)
            .map((recipe) => Recipe.fromJson(recipe))
            .toList();
      }
    } catch (e) {
      print(e);
    }
    return recipes;
  }

  // Fetch a single recipe by ID
  Future<Recipe?> getRecipeById(String id) async {
    Recipe? recipe;
    try {
      final response = await _dio.get("$_baseUrl/recipes/$id");

      if (response.statusCode == 200) {
        recipe = Recipe.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return recipe;
  }

  // Fetch recipes specific to the authenticated user
  Future<List<Recipe>> getUserRecipes(String token) async {
    print("Fetching user recipes...");
    List<Recipe> userRecipes = [];
    try {
      final response = await _dio.get(
        "$_baseUrl/user/recipes",
        options: Options(
          headers: {"Authorization": "Bearer $token"},
        ),
      );

      if (response.statusCode == 200) {
        userRecipes = (response.data as List)
            .map((recipe) => Recipe.fromJson(recipe))
            .toList();
      }
    } catch (e) {
      print(e);
    }
    return userRecipes;
  }

  // Add recipe with image handling
  Future<bool> addRecipe(
    String token,
    String title,
    String category,
    String cookTime,
    String prepTime,
    List<String> ingredients,
    List<String> steps,
    dynamic image, // Either File, XFile (web), or URL
  ) async {
    try {
      FormData formData = FormData.fromMap({
        'title': title,
        'category': category,
        'cookTime': cookTime,
        'prepTime': prepTime,
        'ingredients': ingredients,
        'steps': steps,
      });

      // If image is a File (mobile), add it to formData
      if (image is File) {
        print("image is a file");
        formData.files.add(MapEntry(
          'image',
          await MultipartFile.fromFile(image.path, filename: image.path.split('/').last),
        ));
      } 
      // If image is an XFile (web), handle it accordingly
      else if (image is XFile && kIsWeb) {
        print("image is an XFile (web)");
        formData.files.add(MapEntry(
          'image',
          MultipartFile.fromBytes(
            await image.readAsBytes(), // Read file as bytes for web
            filename: image.name, // Get the filename from XFile
          ),
        ));
      } 
      // If image is a String (URL), add it as a field
      else if (image is String) {
        print("image is a string (URL)");
        formData.fields.add(MapEntry('image', image));
      } 
      // Handle case where the image is neither
      else {
        print("image is neither a file nor a string nor an XFile");
        print(image);
      }

      final response = await _dio.post(
        "$_baseUrl/recipes",
        data: formData,
        options: Options(headers: {'Authorization': 'Bearer $token'}),
      );

      return response.statusCode == 201;
    } catch (e) {
      print("Error adding recipe with image: $e");
      return false;
    }
  }
}
