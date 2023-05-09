import 'package:catstagram/firebase_options.dart';
import 'package:catstagram/screens/login_screen.dart';
import 'package:catstagram/screens/sign_up_screen.dart';
import 'package:catstagram/utils/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Catstagram",
      debugShowCheckedModeBanner: false,
      theme: ThemeData
          .light() /*.copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),*/
      ,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            // Checking if the snapshot has any data or not
            if (snapshot.hasData) {
              // if snapshot has data which means user is logged in then we check the width of screen and accordingly display the screen layout
              return const LoginScreen();
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error}'),
              );
            }
          }

          // means connection to future hasnt been made yet
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return const LoginScreen();
        },
      ),
    );
  }
}

/*class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

          ],
        ),
      ), 
    );
  }
}*/
