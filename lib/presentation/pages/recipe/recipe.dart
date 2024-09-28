import 'package:flutter/material.dart';
import 'package:foodiez_flutter/presentation/pages/recipe/ingredients_card.dart';
import 'package:foodiez_flutter/presentation/pages/recipe/steps_card.dart';
import 'package:foodiez_flutter/presentation/pages/recipe/time_card.dart';
import 'package:foodiez_flutter/presentation/widgets/page.dart';
import 'package:provider/provider.dart';
import 'package:foodiez_flutter/presentation/providers/recipe_provider.dart';

class RecipePage extends StatefulWidget {
  final String id;

  const RecipePage({super.key, required this.id});

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  void initState() {
    super.initState();
    // Fetch the recipe by ID when the page is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RecipeProvider>(context, listen: false).getRecipeById(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RecipeProvider>(
      builder: (context, recipeProvider, child) {
        final recipe = recipeProvider.recipe;

        // Display loading indicator if the recipe is still being fetched
        if (recipe == null) {
          return const Center(child: CircularProgressIndicator());
        }

        return FoodiezPage(children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  recipe.title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 20),
                FadeInImage.assetNetwork(
                  placeholder: 'assets/images/recipe_placeholder.jpg', // Placeholder image
                  image: "http://localhost:8001/${recipe.image}", // Network image URL
                  width: 200,
                  height: 200,
                  fit: BoxFit.contain,
                  imageErrorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    print('Error loading image: $exception');
                    // Display a placeholder image if the network image fails to load
                    return Image.asset(
                      'assets/images/recipe_placeholder.jpg', // Your local placeholder image
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    );
                  },
                ),
                const SizedBox(height: 10),
                if (recipe.cookTime != null && recipe.prepTime != null)
                  TimeCard(
                    cookTime: recipe.cookTime!,
                    prepTime: recipe.prepTime!,
                  ),
                const SizedBox(height: 10),
                if (recipe.ingredients != null && recipe.ingredients!.isNotEmpty)
                  IngrediantsCard(ingredients: recipe.ingredients!),
                const SizedBox(height: 10),
                if (recipe.steps != null && recipe.steps!.isNotEmpty)
                  StepsCard(steps: recipe.steps!),
              ],
            ),
          )
        ]);
      },
    );
  }
}
