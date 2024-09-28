import 'package:flutter/material.dart';
import 'package:foodiez_flutter/domain/models/step.dart' as foodiez;

class StepsCard extends StatelessWidget {
  final List<foodiez.RecipeStep>? steps;
  const StepsCard({super.key, required this.steps});

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
                "Steps",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              // Display the ordered list of steps
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: steps
                        ?.asMap() // Create a map from the list to access the index
                        .entries
                        .map<Widget>(
                          (entry) => Text(
                            '${entry.key + 1}. ${entry.value.step}', // Display the step with its number
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        )
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
