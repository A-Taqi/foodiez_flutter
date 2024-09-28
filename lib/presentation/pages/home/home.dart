import 'package:flutter/material.dart';
import 'package:foodiez_flutter/presentation/pages/home/banner.dart';
import 'package:foodiez_flutter/presentation/widgets/recipe_card.dart';
import 'package:foodiez_flutter/presentation/widgets/categories.dart';
import 'package:foodiez_flutter/presentation/widgets/page.dart';
import 'package:provider/provider.dart';

import '../../providers/recipe_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Trigger fetching recipes after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<RecipeProvider>(context, listen: false).getRecipes();
    });
  }

  @override
  Widget build(BuildContext context) {
    const double runSpacing = 4;
    const double spacing = 4;

    return FoodiezPage(
      children: <Widget>[
        const HomeBanner(),
        const Center(child: CategorySelection()),
        // Show recipes from Provider directly
        Consumer<RecipeProvider>(
          builder: (context, recipeProvider, child) {
            // Show loading indicator while fetching recipes
            if (recipeProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // Handle empty recipes list
            if (recipeProvider.recipes.isEmpty) {
              return const Center(child: Text('No recipes available.'));
            }

            // Show the list of recipes
            return Center(
              child: Wrap(
                runSpacing: runSpacing,
                spacing: spacing,
                alignment: WrapAlignment.center,
                children: recipeProvider.recipes
                    .map((recipe) => RecipeCard(recipe: recipe))
                    .toList(growable: false),
              ),
            );
          },
        ),
      ],
    );
  }
}
