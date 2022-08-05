import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopblocks_flutter/screens/home.dart';
import 'package:shopblocks_flutter/screens/landing_page.dart';
import 'package:shopblocks_flutter/screens/login.dart';
import 'utils/colors.dart' as colors;

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
    ),
  );
}
