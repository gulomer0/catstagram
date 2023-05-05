import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  var _emailController = TextEditingController();
  var _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text("from Login Screen", style: TextStyle(color: Colors.orangeAccent)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Lottie.asset('assets/lotties/happy_cat.json'),
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
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
                ),
                onPressed: () {
                  // Respond to button press
                },
                child: Text('Login'),
              ),
            ),
           Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                TextButton(
                  onPressed: () {
                    // Respond to button press
                  },
                  child: Text('Sign Up', style: TextStyle(color: Colors.orangeAccent)),
                ),
              ],
            ),
          ],
        ),
      ), 
    );
  }
}