import 'package:catstagram/utils/dimensions.dart';
import 'package:flutter/material.dart';

class ResponsiveLayout extends StatefulWidget {

  final Widget webScreenLayout;
  final Widget mobileScreenLayout;

  const ResponsiveLayout({super.key, required this.webScreenLayout, required this.mobileScreenLayout});
  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints){
        if(constraints.maxWidth > webScreenSize){
          return widget.webScreenLayout;
        } else {
          return widget.mobileScreenLayout;
        }
      },
    );
  }
}