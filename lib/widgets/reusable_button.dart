import 'package:flutter/material.dart';
import 'package:shopblocks_flutter/utils/colors.dart' as colors;
import 'package:shopblocks_flutter/utils/text_styles.dart' as texts;

class ReusableButton extends StatelessWidget {
  const ReusableButton({Key? key, required this.onPress}) : super(key: key);

  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => {},
      color: colors.primaryColor,
      padding: const EdgeInsets.all(0),
      shape: const StadiumBorder(),
      child: Padding(
        padding: const EdgeInsets.only(
            left: 30.0, right: 30.0, top: 10.0, bottom: 10.0),
        child: Text(style: texts.button, 'Connect to MetaMask'),
      ),
    );
  }
}
