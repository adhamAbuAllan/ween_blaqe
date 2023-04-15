import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;



class AddImageTest extends StatefulWidget {
  @override
  _AddImageTestState createState() => _AddImageTestState();
}

class _AddImageTestState extends State<AddImageTest> {
  List<File> _imageFiles = [];

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFiles.add(File(pickedFile.path));
      });
    }
  }

  Future<void> _uploadImages() async {
    // You will need to replace this URL with your own server URL
    final url = 'https://example.com/upload_images';

    try {
      final request = http.MultipartRequest('POST', Uri.parse(url));

      for (final file in _imageFiles) {
        request.files.add(await http.MultipartFile.fromPath('images', file.path));
      }

      final response = await request.send();

      if (response.statusCode == 200) {
        // Images uploaded successfully
        print('Images uploaded successfully');
      } else {
        // Error uploading images
        print('Error uploading images');
      }
    } catch (error) {
      print('Error uploading images: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Apartment Photos'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _imageFiles.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () => _pickImage(ImageSource.gallery),
                      );
                    }

                    final file = _imageFiles[index - 1];

                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: Image.file(
                        file,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _uploadImages,
                child: Text('Upload Images'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
