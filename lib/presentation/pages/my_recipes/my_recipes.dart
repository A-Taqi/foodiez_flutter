import 'package:flutter/material.dart';
import 'package:foodiez_flutter/presentation/widgets/recipe_card.dart';
import 'package:foodiez_flutter/presentation/widgets/page.dart';
import 'package:provider/provider.dart';
import 'package:foodiez_flutter/presentation/providers/recipe_provider.dart';
import 'package:foodiez_flutter/presentation/providers/auth_provider.dart';

class MyRecipesPage extends StatefulWidget {
  const MyRecipesPage({super.key});

  @override
  State<MyRecipesPage> createState() => _MyRecipesPageState();
}

class _MyRecipesPageState extends State<MyRecipesPage> {
  @override
  void initState() {
    super.initState();
    print("MyRecipesPage initialized");
    // Fetch the user's recipes when the page is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("addPostFrameCallback...");
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      print("AuthProvider: $authProvider");
      final token = authProvider.token; // Fetch the token from AuthProvider
      print("Token: $token");
      if (token != null) {
        print("Token is not null");
        Provider.of<RecipeProvider>(context, listen: false).getUserRecipes(token); // Fetch user-specific recipes
        print("getUserRecipes called");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FoodiezPage(
      children: <Widget>[
        Consumer<RecipeProvider>(
          builder: (context, recipeProvider, child) {
            final myRecipes = recipeProvider.userRecipes; // User's recipes

            // Show loading spinner while fetching
            if (myRecipes.isEmpty && !recipeProvider.isLoading) {
              return const Center(child: Text('No recipes available.'));
            }

            if (recipeProvider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            // Display user's recipes
            return Center(
              child: Wrap(
                runSpacing: 4,
                spacing: 4,
                alignment: WrapAlignment.center,
                children: myRecipes
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
