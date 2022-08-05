import 'package:flutter/material.dart';
import 'package:shopblocks_flutter/utils/colors.dart' as colors;
import 'package:shopblocks_flutter/widgets/custom_sliver_widget.dart';
import 'package:shopblocks_flutter/widgets/top_bar.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      body: CustomSliverView(
        columnList: [
          TopBar(
            hasback: false,
            onChanged: (value) {
              //TODO: do something if it screen changes
            },
            title: 'Profile',
          ),
        ],
      ),
    );
  }
}
