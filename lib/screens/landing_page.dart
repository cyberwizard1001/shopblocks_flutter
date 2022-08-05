import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopblocks_flutter/screens/login.dart';
import 'package:shopblocks_flutter/utils/colors.dart' as colors;
import 'package:shopblocks_flutter/utils/custom_sliver_widget.dart';
import 'package:shopblocks_flutter/utils/text_styles.dart' as texts;

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SvgPicture.asset(
            'assets/images/landing-background.svg',
            fit: BoxFit.fill,
          ),
          //Image(image: const AssetImage('assets/images/landing_background.png'),fit: BoxFit.fitHeight),
          CustomSliverView(
            columnList: [
              Expanded(
                flex: 8,
                child: Container(),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SupplyBlocks',
                        style: GoogleFonts.raleway(
                            fontSize: 40,
                            color: colors.primaryTextColor,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Text(
                        'Some text goes here and looks about ye big',
                        style: GoogleFonts.raleway(
                            fontSize: 25,
                            color: colors.primaryColor,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: colors.primaryColor,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        ),
                        child: Text(
                          "Get started",
                          style: texts.button,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
