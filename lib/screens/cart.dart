import 'package:flutter/material.dart';
import 'package:shopblocks_flutter/utils/colors.dart' as colors;

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colors.scaffoldColor,
        body: SafeArea(child: Text('Hey')));
  }
}
