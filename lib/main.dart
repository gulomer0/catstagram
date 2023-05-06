import 'package:catstagram/firebase_options.dart';
import 'package:catstagram/responsive/mobile_screen_layout.dart';
import 'package:catstagram/responsive/responsive_layout_screen.dart';
import 'package:catstagram/responsive/web_screen_layout.dart';
import 'package:catstagram/screens/login_screen.dart';
import 'package:catstagram/screens/sign_up_screen.dart';
import 'package:catstagram/utils/colors.dart';
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
      theme: ThemeData.light()/*.copyWith(
        scaffoldBackgroundColor: mobileBackgroundColor,
      ),*/,
      home: const SignUpScreen(),
      
        /*ResponsiveLayout(
        webScreenLayout: WebScreenLayout(), 
        mobileScreenLayout: MobileScreenLayout()
        ),*/
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
