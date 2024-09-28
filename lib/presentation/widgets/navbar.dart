import 'package:flutter/material.dart';
import 'package:foodiez_flutter/presentation/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.toString();
    final authProvider = Provider.of<AuthProvider>(context, listen: true); // Access AuthProvider
    
    // Hide the login/logout button on the login and register pages
    bool hideAuthButtons = currentRoute == '/login' || currentRoute == '/register';

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          InkWell(
            onTap: () => context.replace('/'),
            child: const Image(
              image: AssetImage('assets/images/logo.png'),
              width: 220,
            ),
          ),
          Row(
            children: <Widget>[
              // Always show the Home link
              TextButton(
                onPressed: () {
                  context.replace('/');
                },
                style: TextButton.styleFrom(
                  foregroundColor: Theme.of(context).primaryColor,
                  overlayColor: Colors.transparent,
                ),
                child: const Text("Home"),
              ),

              // Only show "Add Recipe" and "My Recipes" if user is authenticated
              if (authProvider.isAuthenticated) ...[
                TextButton(
                  onPressed: () {
                    context.replace('/add-recipe'); // Navigate to Add Recipe
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor,
                    overlayColor: Colors.transparent,
                  ),
                  child: const Text("Add Recipe"),
                ),
                TextButton(
                  onPressed: () {
                    context.replace('/my-recipes'); // Navigate to My Recipes
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).primaryColor,
                    overlayColor: Colors.transparent,
                  ),
                  child: const Text("My Recipes"),
                ),
              ],
            ],
          ),
          // Show login/logout buttons conditionally
          if (!hideAuthButtons) ...[
            authProvider.isAuthenticated
                ? ElevatedButton(
                    onPressed: () {
                      authProvider.logout(); // Log out the user
                      context.replace('/'); // Redirect to home page after logout
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: const Text("LOGOUT"),
                  )
                : ElevatedButton(
                    onPressed: () {
                      context.replace('/login'); // Redirect to login page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      textStyle: Theme.of(context).textTheme.bodySmall,
                      foregroundColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: const Text("LOGIN"),
                  ),
          ],
        ],
      ),
    );
  }
}
