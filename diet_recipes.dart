import 'package:flutter/material.dart';

class DietRecipes extends StatefulWidget {
  @override
  _DietRecipesState createState() => _DietRecipesState();
}

class _DietRecipesState extends State<DietRecipes> {
  final List<Map<String, String>> dietRecipes = [
    {
      'name': 'Grilled Chicken Salad',
      'ingredients': 'Chicken, lettuce, cucumber, tomato, olive oil.',
      'instructions': 'Grill chicken and serve with fresh salad.'
    },
    {
      'name': 'Quinoa Bowl',
      'ingredients': 'Quinoa, avocado, tomato, cucumber, lime.',
      'instructions': 'Cook quinoa and mix with fresh vegetables.'
    },
    {
      'name': 'Zucchini Noodles with Pesto',
      'ingredients': 'Zucchini, basil pesto, cherry tomatoes, olive oil',
      'instructions': 'Spiralize the zucchini into noodles, sauté lightly in olive oil, and mix with basil pesto and cherry tomatoes.'
    },
    {
      'name': 'Baked Salmon with Asparagus',
      'ingredients': 'Salmon fillet, asparagus, lemon, olive oil, garlic',
      'instructions': 'Place salmon and asparagus on a baking sheet, drizzle with olive oil and lemon, and bake at 200°C for 20 minutes.'
    },
    {
      'name': 'Greek Yogurt Parfait',
      'ingredients': 'Greek yogurt, granola, mixed berries, honey',
      'instructions': ' Layer Greek yogurt, granola, and berries in a glass. Drizzle with honey on top'
    },
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ingredientsController = TextEditingController();
  final TextEditingController _instructionsController = TextEditingController();

  void _addRecipe() {
    if (_nameController.text.isNotEmpty &&
        _ingredientsController.text.isNotEmpty &&
        _instructionsController.text.isNotEmpty) {
      setState(() {
        dietRecipes.add({
          'name': _nameController.text,
          'ingredients': _ingredientsController.text,
          'instructions': _instructionsController.text,
        });
      });
      _nameController.clear();
      _ingredientsController.clear();
      _instructionsController.clear();
      Navigator.pop(context);
    }
  }

  void _openAddRecipeDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add New Diet Recipe'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Recipe Name'),
              ),
              TextField(
                controller: _ingredientsController,
                decoration: InputDecoration(labelText: 'Ingredients'),
              ),
              TextField(
                controller: _instructionsController,
                decoration: InputDecoration(labelText: 'Instructions'),
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: _addRecipe,
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Diet Recipes'),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        itemCount: dietRecipes.length,
        itemBuilder: (context, index) {
          final recipe = dietRecipes[index];
          return Card(
            color: Colors.green[50],
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(recipe['name']!, style: TextStyle(color: Colors.green)),
              subtitle: Text('Ingredients: ${recipe['ingredients']}'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(recipe['name']!),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Ingredients: ${recipe['ingredients']}'),
                        SizedBox(height: 10),
                        Text('Instructions: ${recipe['instructions']}'),
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openAddRecipeDialog,
        child: Icon(Icons.add),
        tooltip: 'Add New Diet Recipe',
      ),
    );
  }
}

