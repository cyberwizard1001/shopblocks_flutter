import 'package:flutter/material.dart';
import 'package:shopblocks_flutter/utils/text_styles.dart' as texts;
import 'package:shopblocks_flutter/utils/colors.dart' as colors;

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
                const SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: colors.lightGreyBackground,
                    hintStyle: texts.paragraph,
                    hintText: 'Enter your username here.',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: TextButton(
                    onPressed: () {
                      //TODO: On press event when connect to MetaMask button is pressed
                    },
                    style: TextButton.styleFrom(
                      backgroundColor: colors.primaryColor,
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                    ),
                    child: Text(
                      "Connect to MetaMask",
                      style: texts.button,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
