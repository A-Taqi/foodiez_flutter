import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../domain/models/recipe.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 250,
      height: 250,
      child: InkWell(
        onTap: () {
          context.go('/recipes/${recipe.id}');
        },
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/recipe_placeholder.jpg', // Placeholder image
                  image: "http://localhost:8001/${recipe.image}",
                  width: 170,
                  height: 170,
                  fit: BoxFit.contain,
                  imageErrorBuilder: (context, error, stackTrace) {
                    // In case of an error, fall back to placeholder
                    return Image.asset(
                      'assets/images/recipe_placeholder.jpg',
                      width: 170,
                      height: 170,
                      fit: BoxFit.contain,
                    );
                  },
                ),
              ),
              Badge(
                label: Text(recipe.category.categoryName),
              ),
              Center(
                child: Text(
                  recipe.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
