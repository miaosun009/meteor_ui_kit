import 'package:flutter/material.dart';
import 'package:meteor_ui_kit/components.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({Key? key}) : super(key: key);

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const UIText("Meteor UIKit"),
      ),
      body: ListView(
        children: [
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/themeSetting');
            },
            child: const UIText(
              "Theme Setting",
            ),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/colorScheme');
            },
            child: const UIText("Color Scheme"),
          ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/textPage');
            },
            child: const UIText("UIText"),
          ),
        ],
      ),
    );
  }
}
