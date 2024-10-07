import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:ween_blaqe/constants/strings.dart';

import '../main.dart';

class UpdateUserWidgetTest extends StatefulWidget {

  const UpdateUserWidgetTest({super.key});

  @override
  State<UpdateUserWidgetTest> createState() => _UpdateUserWidgetTestState();
}

class _UpdateUserWidgetTestState extends State<UpdateUserWidgetTest> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();

  Future<void> _updateUser() async {
    if (_formKey.currentState!.validate()) {
      var ownerId = (await sp).get("id");

      final url = Uri.parse(ServerWeenBalaqee.userUpdate);
      // Replace with your API endpoint
    final response = await http.post(
      url,
    body: jsonEncode({
    'id': ownerId,
    'name': _nameController.text,
    'phone': _phoneController.text,
    }),
    headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
    // Update successful, handle response (e.g., show a success message)
    print('User updated successfully');
    } else {
    // Update failed, handle error (e.g., show an error message)
    print('Failed to update user');
    }
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Phone'),
                validator: (value) {
                  // Add phone number validation if needed
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: _updateUser,
                child: const Text('Update User'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
