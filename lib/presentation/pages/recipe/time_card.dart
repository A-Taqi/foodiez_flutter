import 'package:flutter/material.dart';
import 'package:foodiez_flutter/domain/models/time.dart';

class TimeCard extends StatelessWidget {
  final Time cookTime;
  final Time prepTime;
  const TimeCard({super.key, required this.cookTime, required this.prepTime});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: 500,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("Prep Time", style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)),
                        Text("${prepTime.value} ${prepTime.type}"),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("Cook Time", style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)),
                        Text("${cookTime.value} ${cookTime.type}"),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("Total Time",
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold)),
                        Text(
                            "${(prepTime.value) + (cookTime.value)} ${cookTime.type}"),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}