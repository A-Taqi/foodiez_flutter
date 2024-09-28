import 'package:flutter/material.dart';
import 'package:foodiez_flutter/presentation/widgets/page.dart';
import 'package:provider/provider.dart';
import 'package:foodiez_flutter/presentation/providers/auth_provider.dart'; // Import AuthProvider
import 'package:go_router/go_router.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _register() async {
    if (_formKey.currentState!.validate()) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);

      // Call the register function in the AuthProvider
      final errorMessage = await authProvider.register(
        _usernameController.text.trim(),
        _passwordController.text.trim(),
      );

      if (errorMessage == null) {
        // If registration is successful, navigate to the login page
        context.replace('/login');
      } else {
        // Display the error message from the backend
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FoodiezPage(children: <Widget>[
      Center(
        child: FittedBox(
          fit: BoxFit.contain,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 300,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Create Your Account!',
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          hintText: 'Username',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a username';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          hintText: 'Password',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: _register, // Call _register on press
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          textStyle: Theme.of(context).textTheme.bodySmall,
                          foregroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                        ),
                        child: const Text("Register"),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          const Text("Already have an account?"),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              context.replace('/login');
                            },
                            style: TextButton.styleFrom(
                              foregroundColor: Theme.of(context).primaryColor,
                              overlayColor: Colors.transparent,
                            ),
                            child: const Text("LOG IN"),
                          ),
                        ],
                      )
                    ],
                  ),
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
    ]);
  }
}

