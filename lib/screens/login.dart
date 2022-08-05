import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopblocks_flutter/utils/text_styles.dart' as texts;
import 'package:shopblocks_flutter/utils/colors.dart' as colors;

import '../utils/custom_sliver_widget.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      body: Stack(
        children: <Widget>[
          SvgPicture.asset(
            'assets/images/landing-background.svg',
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.05,
              right: MediaQuery.of(context).size.width * 0.05,
            ),
            child: CustomSliverView(columnList: [
              Expanded(
                flex: 8,
                child: Container(),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("LOGIN", style: texts.heading1),
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 50,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: colors.accentColor,
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
                    ),
                    const SizedBox(height: 20),
                    TextButton(
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
                    )
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
