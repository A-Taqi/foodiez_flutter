import 'package:flutter/material.dart';
import 'package:foodiez_flutter/presentation/widgets/page.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:foodiez_flutter/presentation/providers/auth_provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FoodiezPage(
      children: <Widget>[
        Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 300,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Welcome Back!',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          hintText: 'Username',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _isLoading ? null : _login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          textStyle: Theme.of(context).textTheme.bodySmall,
                          foregroundColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                        child: _isLoading
                            ? const CircularProgressIndicator()
                            : const Text("LOGIN"),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Don't have an account?"),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              context.replace('/register');
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Theme.of(context).primaryColor,
                              overlayColor: Colors.transparent,
                            ),
                            child: const Text("Register"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Image(
                  image: AssetImage("assets/images/eating.png"),
                  width: 512,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    String username = _usernameController.text;
    String password = _passwordController.text;

    // Perform login using AuthProvider
    bool success = await context.read<AuthProvider>().login(username, password);

    if (success) {
      // If login is successful, navigate to the home page
      context.go('/');
    } else {
      // Show an error dialog if login failed
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text("Login failed. Please try again."),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    setState(() {
      _isLoading = false;
    });
  }
}
