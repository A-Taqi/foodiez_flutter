import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:foodiez_flutter/presentation/widgets/page.dart';
import 'package:image_picker/image_picker.dart'; // Import ImagePicker
import 'dart:io';
import 'package:provider/provider.dart';
import 'package:foodiez_flutter/presentation/providers/recipe_provider.dart';
import 'package:foodiez_flutter/presentation/providers/auth_provider.dart';
import 'package:go_router/go_router.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  _AddRecipePageState createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _cookTimeController = TextEditingController();
  final TextEditingController _prepTimeController = TextEditingController();
  final TextEditingController _ingredientController = TextEditingController();
  final TextEditingController _stepController = TextEditingController();
  final List<String> _ingredients = [];
  final List<String> _steps = [];
  dynamic
      _selectedImage; // To store the selected image, dynamic to handle both file and XFile

  // For picking the image using ImagePicker
  final ImagePicker _picker = ImagePicker();

  void _addIngredient() {
    if (_ingredientController.text.isNotEmpty) {
      setState(() {
        _ingredients.add(_ingredientController.text);
        _ingredientController.clear();
      });
    }
  }

  void _addStep() {
    if (_stepController.text.isNotEmpty) {
      setState(() {
        _steps.add(_stepController.text);
        _stepController.clear();
      });
    }
  }

  // Function to pick an image
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        if (kIsWeb) {
          _selectedImage = pickedFile; // Store XFile for web
        } else {
          _selectedImage = File(pickedFile.path); // Store File for mobile
        }
      });
    }
  }

  Future<void> _submitRecipe() async {
    if (_formKey.currentState!.validate()) {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final token = authProvider.token;

      if (token != null && _selectedImage != null) {
        final recipeProvider =
            Provider.of<RecipeProvider>(context, listen: false);

        final success = await recipeProvider.addRecipe(
          token,
          _titleController.text,
          _categoryController.text,
          _cookTimeController.text,
          _prepTimeController.text,
          _ingredients,
          _steps,
          _selectedImage!, // Pass the image file to the backend
        );

        if (success) {
          context.replace('/my-recipes');
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
                content: Text('Failed to add recipe. Please try again.')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Please select an image for your recipe.')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FoodiezPage(children: <Widget>[
      Center(
        child: 
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: 400,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _titleController,
                      decoration: const InputDecoration(
                        labelText: 'Recipe Title',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _categoryController,
                      decoration: const InputDecoration(
                        labelText: 'Category',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a category';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _cookTimeController,
                      decoration: const InputDecoration(
                        labelText: 'Cook Time (minutes)',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter cook time';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _prepTimeController,
                      decoration: const InputDecoration(
                        labelText: 'Prep Time (minutes)',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter prep time';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _ingredientController,
                      decoration: const InputDecoration(
                        labelText: 'Ingredient',
                      ),
                      onFieldSubmitted: (_) => _addIngredient(),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _addIngredient,
                      child: const Text('Add Ingredient'),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      children: _ingredients
                          .map((ingredient) => Chip(label: Text(ingredient)))
                          .toList(),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _stepController,
                      decoration: const InputDecoration(
                        labelText: 'Step',
                      ),
                      onFieldSubmitted: (_) => _addStep(),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: _addStep,
                      child: const Text('Add Step'),
                    ),
                    const SizedBox(height: 10),
                    Wrap(
                      children: _steps
                          .map((step) => Chip(label: Text(step)))
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    // Button to pick image from gallery
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: const Text('Pick an Image'),
                    ),
                    const SizedBox(height: 10),
                    // Show selected image preview
                    _selectedImage != null
                        ? kIsWeb
                            ? SizedBox(
                                width: 200,
                                height: 200,
                                child: Image.network(
                                  (_selectedImage as XFile).path, // For web
                                  fit: BoxFit
                                      .contain, // Ensure the image fits within the box
                                ),
                              )
                            : SizedBox(
                                width: 200,
                                height: 200,
                                child: Image.file(
                                  _selectedImage as File, // For mobile
                                  fit: BoxFit
                                      .contain, // Ensure the image fits within the box
                                ),
                              )
                        : const Text('No image selected.'),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _submitRecipe,
                      child: const Text('Submit Recipe'),
                    ),
                  ],
                ),
              ),
            ),
          )
      )
    ]);
  }
}
