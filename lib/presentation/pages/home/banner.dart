import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  'UNLEASH YOUR INNER CHEF!',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  'Embrace the joy of cooking with Foodiez - Where every ingredient tells a story',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ],
            ),
            const Image(
                image: AssetImage("assets/images/chef.png"), width: 512),
          ],
        ),
      ),
    );
  }
}