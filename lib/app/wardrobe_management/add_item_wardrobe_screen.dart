import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddItemScreen extends StatefulWidget {
  @override
  _AddItemScreenState createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController brandController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController tagController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  void saveItem() async {
    if (_formKey.currentState!.validate()) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('brand', brandController.text);
      await prefs.setString('size', sizeController.text);
      await prefs.setString('color', colorController.text);
      await prefs.setString('price', priceController.text);
      await prefs.setString('tag', tagController.text);
      await prefs.setString('details', detailsController.text);
      Navigator.pop(
          context); // Go back to the previous screen with a success message
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Item"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: brandController,
                decoration: InputDecoration(labelText: 'Brand'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a brand' : null,
              ),
              TextFormField(
                controller: sizeController,
                decoration: InputDecoration(labelText: 'Size'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a size' : null,
              ),
              TextFormField(
                controller: colorController,
                decoration: InputDecoration(labelText: 'Colour'),
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a colour' : null,
              ),
              TextFormField(
                controller: priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
                validator: (value) =>
                    value!.isEmpty ? 'Please enter a price' : null,
              ),
              TextFormField(
                controller: tagController,
                decoration: InputDecoration(labelText: 'Tag'),
              ),
              TextFormField(
                controller: detailsController,
                decoration: InputDecoration(labelText: 'Other Details'),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveItem,
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
