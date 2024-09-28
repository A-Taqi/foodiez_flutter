import 'package:flutter/material.dart';
import 'package:foodiez_flutter/domain/models/category.dart';
import 'package:foodiez_flutter/data/services/category_service.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> categories = [];

  final CategoryService _categoryService = CategoryService();

  // Fetch all recipes
  Future<void> getCategories() async {
    categories = await _categoryService.getCategories();
    notifyListeners();
  }
}
