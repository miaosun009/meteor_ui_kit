import 'package:flutter/material.dart';

class ColorSchemePage extends StatefulWidget {
  const ColorSchemePage({Key? key}) : super(key: key);

  @override
  State<ColorSchemePage> createState() => _ColorSchemePageState();
}

class _ColorSchemePageState extends State<ColorSchemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UIColorScheme"),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
