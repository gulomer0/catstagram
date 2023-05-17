import 'dart:typed_data';

import 'package:catstagram/providers/user_provider.dart';
import 'package:catstagram/resources/firestore_methods.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:catstagram/providers/user_provider.dart';
import 'package:catstagram/resources/firestore_methods.dart';
import 'package:catstagram/utils/colors.dart';
import 'package:catstagram/utils/utils.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _file;
  bool isLoading = false;
  final TextEditingController _descriptionController = TextEditingController();

  _selectImage(BuildContext parentContext) async {
    return showDialog(
      context: parentContext,
      builder: (BuildContext context) {
        return SimpleDialog(
          children: <Widget>[
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Take a photo', textAlign: TextAlign.center,),
                onPressed: () async {
                  Navigator.pop(context);
                  Uint8List file = await pickImage(ImageSource.camera);
                  setState(() {
                    _file = file;
                  });
                }),
            SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text('Choose from Gallery', textAlign: TextAlign.center,),
                onPressed: () async {
                  Navigator.of(context).pop();
                  Uint8List file = await pickImage(ImageSource.gallery);
                  setState(() {
                    _file = file;
                  });
                }),
          ],
        );
      },
    );
  }

  void postImage(String uid, String username, String profImage) async {
    setState(() {
      isLoading = true;
    });
    // start the loading
    try {
      // upload to storage and db
      String res = await FireStoreMethods().uploadPost(
        _descriptionController.text,
        _file!,
        uid,
        username,
        profImage,
      );
      if (res == "success") {
        setState(() {
          isLoading = false;
        });
        showSnackBar(
          context,
          'Posted!',
        );
        clearImage();
      } else {
        showSnackBar(context, res);
      }
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(
        context,
        err.toString(),
      );
    }
  }

  void clearImage() {
    setState(() {
      _file = null;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _descriptionController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final UserProvider userProvider = Provider.of<UserProvider>(context);

    return _file == null
        ? WillPopScope(
          onWillPop: () async => false,
          child: Center(
              child: IconButton(
                iconSize: 50,
                icon: const Icon(
                  Icons.upload,
                ),
                onPressed: () => _selectImage(context),
              ),
            ),
        )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              leading: IconButton(
                icon: const Icon(Icons.cancel,
                color: Colors.orangeAccent,),
                onPressed: clearImage,
              ),
              centerTitle: false,
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    postImage(
                      userProvider.getUser.uid,
                      userProvider.getUser.username,
                      userProvider.getUser.photoUrl,
                    );
                    print("${userProvider.getUser.uid}");
                  },
                  child: Text(
                    "Post",
                    style: TextStyle(
                        color: Colors.orangeAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.02,
                ),
              ],
            ),
            // POST FORM
            body: Column(
              children: <Widget>[
                isLoading
                    ? const LinearProgressIndicator(
                      color: Colors.orangeAccent
                    )
                    : const Padding(padding: EdgeInsets.only(top: 0.0)),
                Divider(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                   /*CircleAvatar(
                     backgroundImage: NetworkImage(
                       userProvider.getUser.photoUrl,
                      ),
                    ),*/
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.3,
                      child: TextField(
                        cursorColor: Colors.orangeAccent,
                        controller: _descriptionController,
                        decoration: const InputDecoration(
                          
                            hintText: "Write a caption...",
                            border: InputBorder.none),
                        maxLines: 8,
                      ),
                    ),
                    SizedBox(
                      height: 170,
                      width: 170,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            alignment: FractionalOffset.topCenter,
                            image: MemoryImage(_file!),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
              ],
            ),
          );
  }
}