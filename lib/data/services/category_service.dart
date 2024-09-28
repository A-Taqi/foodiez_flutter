import 'package:dio/dio.dart';
import 'package:foodiez_flutter/domain/models/category.dart';

class CategoryService {
  final Dio _dio = Dio();
  final _baseUrl = "http://localhost:8001";

  // Fetch all recipes
  Future<List<Category>> getCategories() async {
    List<Category> categories = [];
    try {
      final response = await _dio.get("$_baseUrl/categories");

      if (response.statusCode == 200) {
        categories = (response.data as List)
            .map((recipe) => Category.fromJson(recipe))
            .toList();
      }

    } catch (e) {
      print(e);
    }
    return categories;
  }
}
