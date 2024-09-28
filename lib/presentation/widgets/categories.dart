import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/category_provider.dart';
import '../providers/recipe_provider.dart';

class CategorySelection extends StatefulWidget {
  const CategorySelection({super.key});

  @override
  State<CategorySelection> createState() => _CategorySelectionState();
}

class _CategorySelectionState extends State<CategorySelection> {
  String selectedCategory = "All"; // Default selected category

  @override
  void initState() {
    super.initState();
    // Fetch categories when the widget is initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<CategoryProvider>(context, listen: false).getCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryProvider>(
      builder: (context, categoryProvider, child) {
        // Include the default "All" category at the beginning of the list
        final categories = ["All", ...categoryProvider.categories.map((c) => c.categoryName).toList()];

        return Container(
          width: 150,
          margin: const EdgeInsets.only(bottom: 20),
          child: DropdownButtonFormField(
            value: selectedCategory, // Default selection is "All"
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Category",
            ),
            items: categories.map((String category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                selectedCategory = newValue!;
                // Trigger recipe filtering when the category changes
                Provider.of<RecipeProvider>(context, listen: false).filterRecipes(selectedCategory);
              });
            },
            onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          ),
        );
      },
    );
  }
}
