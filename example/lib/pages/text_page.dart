import 'package:flutter/material.dart';
import 'package:meteor_ui_kit/components.dart';
import 'package:meteor_ui_kit/foundation.dart';

class TextPage extends StatefulWidget {
  const TextPage({Key? key}) : super(key: key);

  @override
  State<TextPage> createState() => _TextPageState();
}

class _TextPageState extends State<TextPage> {
  @override
  Widget build(BuildContext context) {
    final colors = UIKitTheme.extension<UIColorScheme>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("UIText"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
        children: [
          UIText.title("Font Size"),
          Divider(),
          UIText.h1("Headline1"),
          UIText.h2("Headline2"),
          UIText.h3("Headline3"),
          UIText.h4("Headline4"),
          UIText.h5("Headline5"),
          UIText.h6("Headline6"),
          UIText.title("Title"),
          UIText.subtitle("SubTitle"),
          UIText.body("Body"),
          UIText.label("Label"),
          UIText.micro("Micro Text"),
          SizedBox(height: 4),
          UIText.h1(
            "This is a line of auto-sized text. The original size is Headline1 and the minimum font size is 10",
            maxLines: 2,
            minFontSize: 10,
          ),
          SizedBox(height: 24),
          UIText.title("Font Color"),
          Divider(),
          UIText.body("Primary text", fontColor: UIFontColor.primary),
          UIText.body("Success text", fontColor: UIFontColor.success),
          UIText.body("Warning text", fontColor: UIFontColor.warning),
          UIText.body("Error text", fontColor: UIFontColor.error),
          UIText.body("Link text", fontColor: UIFontColor.link),
          UIText.body("Headline text", fontColor: UIFontColor.headline),
          UIText.body("Title text", fontColor: UIFontColor.title),
          UIText.body("Regular text", fontColor: UIFontColor.regular),
          UIText.body("Secondary text", fontColor: UIFontColor.secondary),
          UIText.body("Tertiary text", fontColor: UIFontColor.tertiary),
          SizedBox(height: 4),
          Container(
            color: colors?.primary,
            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
            child: UIText.body("Inverse text", fontColor: UIFontColor.inverse),
          ),
          SizedBox(height: 24),
          UIText.title("Font Weight"),
          Divider(),
          UIText.h6("Bold text", fontWeight: UIFontWeight.bold),
          UIText.h6("Medium Bold text", fontWeight: UIFontWeight.medium),
          UIText.h6("Regular text", fontWeight: UIFontWeight.regular),
          UIText.h6("Light text", fontWeight: UIFontWeight.light),
        ],
      ),
    );
  }
}
