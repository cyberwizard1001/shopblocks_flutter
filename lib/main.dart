import 'package:firebase_core/firebase_core.dart';
import 'package:shopblocks_flutter/screens/item_details.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopblocks_flutter/screens/home.dart';
import 'package:shopblocks_flutter/screens/landing_page.dart';
import 'package:shopblocks_flutter/screens/login.dart';
import 'utils/colors.dart' as colors;

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const Home(),
    ),
  );
}
