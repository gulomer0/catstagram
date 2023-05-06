import 'dart:typed_data';

import 'package:catstagram/resources/auth_methods.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignUpScreen> {

  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();
  var _bioController = TextEditingController();
  var _usarnameController = TextEditingController();
  //-Uint8List? _image;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usarnameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("from Sign Up Screen", style: TextStyle(color: Colors.orangeAccent)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 70,
            ),
            Stack(
              children: [
                CircleAvatar(
                  radius: 80,
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage("assets/images/empty.jpeg"),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      // Respond to button press
                    },
                    icon: Icon(
                      size: 30,
                      Icons.add_a_photo, 
                      ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 35,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: _usarnameController,
                cursorColor: Colors.orangeAccent,
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Enter your username",
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: _emailController,
                cursorColor: Colors.orangeAccent,
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Enter your email",
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: _passwordController,
                cursorColor: Colors.orangeAccent,
                obscureText: true,
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Enter your password", 
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: TextField(
                controller: _bioController,
                cursorColor: Colors.orangeAccent,
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Enter your bio",
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
                ),
                onPressed: () async{
                  String res = await AuthMethods().signUpUser(
                    email: _emailController.text,
                    password: _passwordController.text,
                    username: _usarnameController.text,
                    bio: _bioController.text,
                    //-file: _image!,
                  );
                },
                child: Text('Sign Up'),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text('Login', style: TextStyle(color: Colors.orangeAccent)),
                ),
              ],
            ),
          ],
        ),
      ), 
    );
  }
}