import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopblocks_flutter/utils/colors.dart' as colors;
import 'package:shopblocks_flutter/utils/custom_sliver_widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SvgPicture.asset('assets/images/landing-background.svg',fit: BoxFit.fill,),
          //Image(image: const AssetImage('assets/images/landing_background.png'),fit: BoxFit.fitHeight),
          CustomSliverView(
           columnList: [
              Expanded(child: Container(),flex: 5,),
              Expanded(child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                        Text('SupplyBlocks',style: GoogleFonts.raleway(fontSize: 45,color: colors.primaryTextColor,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),flex: 3,)
            ],
          )
        ],
      ),
    );
  }
}
