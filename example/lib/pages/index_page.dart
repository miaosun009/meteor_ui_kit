import 'package:flutter/material.dart';

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
        title: Text("Meteor UIKit"),
      ),
      body: ListView(
        children: [
          // MaterialButton(
          //   onPressed: () {
          //     Navigator.of(context).pushNamed('/colorScheme');
          //   },
          //   child: Text("Colors"),
          // ),
          MaterialButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/themeSetting');
            },
            child: Text("Theme Setting"),
          )
        ],
      ),
    );
  }
}
