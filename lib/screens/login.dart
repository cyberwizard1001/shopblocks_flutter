import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopblocks_flutter/utils/text_styles.dart' as texts;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //TODO: ADD BACKGROUND SVG HERE
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.08,
              right: MediaQuery.of(context).size.width * 0.08,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("LOGIN", style: texts.heading1),
                SizedBox(height: 10),
                TextField(
                  decoration: InputDecoration(
                    hintStyle: texts.paragraph,
                    hintText: 'Enter your username here.',
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
