import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopblocks_flutter/utils/colors.dart' as colors;
import 'package:shopblocks_flutter/utils/text_styles.dart' as texts;

class TopBar extends StatelessWidget {
  const TopBar(
      {Key? key, required this.title, this.onChanged, required this.hasback})
      : super(key: key);

  final String title;
  final void Function(String?)? onChanged;
  final bool hasback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: 20,
        top: 50,
        right: MediaQuery.of(context).size.width * 0.05,
        left: MediaQuery.of(context).size.width * 0.05,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (hasback)
                GestureDetector(
                  onTap: () => {Navigator.pop(context)},
                  child: Ink(
                    decoration: const ShapeDecoration(
                      color: colors.lightGreyBackground,
                      shape: CircleBorder(),
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Ionicons.arrow_back,
                        color: colors.primaryTextColor,
                      ),
                    ),
                  ),
                ),
              if (hasback == false)
                Ink(
                  decoration: const ShapeDecoration(
                    color: colors.lightGreyBackground,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Ionicons.location_outline,
                      // size: 30,
                      color: colors.primaryTextColor,
                    ),
                  ),
                ),
              Text(
                title,
                style: texts.heading2,
              ),
              if (hasback == false)
                Ink(
                  decoration: const ShapeDecoration(
                    color: colors.lightGreyBackground,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Ionicons.settings_outline,
                      // size: 30,
                      color: colors.primaryTextColor,
                    ),
                  ),
                ),
              if (hasback)
                Ink(
                  decoration: const ShapeDecoration(
                    color: Colors.transparent,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Ionicons.settings_outline,
                      // size: 30,
                      color: Colors.transparent,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
