
import 'dart:io';
import 'package:catstagram/resources/firestore_methods.dart';
import 'package:catstagram/screens/add_screen_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {

_getFromGallery() async {
    
    PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxWidth: 1800,
        maxHeight: 1800,
    );
    if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
    }
}

_getFromCamera() async {

    PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800,
    );
    if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
    }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: IconButton(
        iconSize: MediaQuery.of(context).size.width * 0.15,
        color: Colors.orangeAccent,
        icon: Icon(Icons.upload),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  elevation: 0,
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _getFromCamera();
                          },
                          child: Text("Take a Photo", style: TextStyle(color: Colors.orangeAccent),)),
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            _getFromGallery();
                          },
                          child: Text("Choose from Gallery", style: TextStyle(color: Colors.orangeAccent),)),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AddScreen2(
                                          imageFile: null,
                                        )));
                          },
                          child: Text("Add Screen 2", style: TextStyle(color: Colors.orangeAccent),)
                      ),
                    ],
                  ),
                );
              });
        },
      )),
    );
  }
}
