import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:foodiez_flutter/presentation/pages/add_recipe/add_recipe.dart';
import 'package:foodiez_flutter/presentation/pages/home/home.dart';
import 'package:foodiez_flutter/presentation/pages/login/login.dart';
import 'package:foodiez_flutter/presentation/pages/my_recipes/my_recipes.dart';
import 'package:foodiez_flutter/presentation/pages/recipe/recipe.dart';
import 'package:foodiez_flutter/presentation/pages/register/register.dart';
import 'package:foodiez_flutter/presentation/providers/auth_provider.dart';
import 'package:foodiez_flutter/presentation/providers/category_provider.dart';
import 'package:foodiez_flutter/presentation/providers/recipe_provider.dart';
import 'package:foodiez_flutter/presentation/themes/theme.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

// GoRouter configuration
final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
      routes: <RouteBase>[
        GoRoute(
          path: 'login',
          builder: (BuildContext context, GoRouterState state) {
            // Redirect to home if user is already authenticated
            final isAuthenticated = context.read<AuthProvider>().isAuthenticated;
            if (isAuthenticated) {
              return const HomePage(); // Redirect to home page if already authenticated
            }
            return const LoginPage(); // Otherwise, show login page
          },
        ),
        GoRoute(
          path: 'register',
          builder: (BuildContext context, GoRouterState state) {
            // Redirect to home if user is already authenticated
            final isAuthenticated = context.read<AuthProvider>().isAuthenticated;
            if (isAuthenticated) {
              return const HomePage(); // Redirect to home page if already authenticated
            }
            return const RegisterPage(); // Otherwise, show register page
          },
        ),
        GoRoute(
          path: 'recipes/:id',
          builder: (BuildContext context, GoRouterState state) {
            // Pass the ID to the RecipePage using the path parameters
            return RecipePage(id: state.pathParameters['id']!);
          },
        ),
        GoRoute(
            path: 'my-recipes',
            builder: (BuildContext context, GoRouterState state) {
              // Redirect to login if user is not authenticated
              final isAuthenticated = context.read<AuthProvider>().isAuthenticated;
              if (!isAuthenticated) {
                return const LoginPage(); // Redirect to login page if not authenticated
              }
              return const MyRecipesPage(); // Show user's recipes if authenticated
            },
          ),
          GoRoute(
            path: 'add-recipe',
            builder: (BuildContext context, GoRouterState state) {
              // Redirect to login if user is not authenticated
              final isAuthenticated = context.read<AuthProvider>().isAuthenticated;
              if (!isAuthenticated) {
                return const LoginPage(); // Redirect to login page if not authenticated
              }
              return const AddRecipePage(); // Show user's recipes if authenticated
            },
          ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => RecipeProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
        scrollBehavior: NoThumbScrollBehavior().copyWith(scrollbars: false),
        title: 'Foodiez',
        theme: ThemeData(
          colorScheme: MaterialTheme.lightScheme(),
          useMaterial3: true,
        ),
      ),
    );
  }
}

// Custom scroll behavior to enable multiple pointer device kinds for scrolling
class NoThumbScrollBehavior extends ScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        PointerDeviceKind.stylus,
        PointerDeviceKind.trackpad,
      };
}
