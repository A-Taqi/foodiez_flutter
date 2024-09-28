import 'package:flutter/material.dart';
import 'package:foodiez_flutter/domain/models/ingredient.dart';

class IngrediantsCard extends StatelessWidget {
  final List<Ingredient>? ingredients;
  const IngrediantsCard({super.key, required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: 500,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Ingredients",
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    const SizedBox(height: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: ingredients
                              ?.map<Widget>(
                                  (ingredient) => Text(ingredient.ingredient))
                              .toList(growable: false) ??
                          [],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}