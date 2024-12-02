import 'package:flutter/material.dart';

class NormalRecipes extends StatefulWidget {
  @override
  _NormalRecipesState createState() => _NormalRecipesState();
}

class _NormalRecipesState extends State<NormalRecipes> {
  final List<Map<String, String>> normalRecipes = [
    {
      'name': 'Stuffed Grape Leaves',
      'ingredients': 'Grape leaves, rice, ground meat, spices.',
      'instructions': 'Stuff and cook grape leaves with spices.'
    },
    {
      'name': 'Mandi',
      'ingredients': 'Rice, chicken, spices, ghee.',
      'instructions': 'Cook chicken with rice and spices.'
    },
    {
      'name': 'Chicken Biryani',
      'ingredients': 'Chicken, rice, yogurt, onion, tomato, spices (turmeric, cumin, coriander), saffron',
      'instructions': 'Cook chicken with spices, layer with cooked rice, and steam with saffron for a rich flavor'
    },
    {
      'name': ' Cheeseburger',
      'ingredients': 'Ground beef patty, burger bun, cheese, lettuce, tomato, mayonnaise',
      'instructions': 'Grill the beef patty, assemble the burger with cheese and toppings, and serve with fries.'
    },
    {
      'name': '  Fettuccine Alfredo',
      'ingredients': ' Fettuccine pasta, heavy cream, parmesan cheese, garlic, butter',
      'instructions': ' Cook the pasta, make a creamy sauce with butter, garlic, and parmesan, and mix well.'
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
        normalRecipes.add({
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
          title: Text('Add New Recipe'),
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
        title: Text('Normal Recipes'),
      ),
      body: ListView.builder(
        itemCount: normalRecipes.length,
        itemBuilder: (context, index) {
          final recipe = normalRecipes[index];
          return Card(
            color: Colors.pink[50],
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(recipe['name']!, style: TextStyle(color: Colors.pinkAccent)),
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
        tooltip: 'Add New Recipe',
      ),
    );
  }
}
