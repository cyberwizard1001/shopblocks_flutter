import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopblocks_flutter/screens/home.dart';
import 'package:shopblocks_flutter/screens/login.dart';
import 'utils/colors.dart' as colors;

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: colors.scaffoldColor,
        primaryColor: colors.primaryTextColor,
        textTheme: TextTheme(
          headline1: GoogleFonts.raleway(
            color: colors.primaryTextColor,
          ),
        ),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: colors.primaryTextColor,
          secondary: colors.accentColor,
        ),
      ),
      home: Login(),
    ),
  );
}
