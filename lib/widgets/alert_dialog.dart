import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopblocks_flutter/utils/colors.dart' as colors;
import 'package:shopblocks_flutter/utils/text_styles.dart' as texts;
import 'package:shopblocks_flutter/widgets/reusable_button.dart';

displayDialog(context, positiveText, negativeText, Function positiveFunction,
    title, subTitle,
    {dismissDialog, willPop}) {
  return showDialog(
    context: context,
    barrierDismissible: dismissDialog ?? true,
    builder: (context) => WillPopScope(
      onWillPop: () async => willPop ?? true,
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        backgroundColor: colors.cardBackgroundColor,
        title: Text(
          title,
          style: GoogleFonts.raleway(
              fontWeight: FontWeight.bold, color: colors.headingTextColor),
        ),
        content: Text(
          subTitle,
          style: GoogleFonts.raleway(
              color: colors.headingTextColor.withOpacity(0.8)),
        ),
        actions: <Widget>[
          negativeText != null
              ? TextButton(
                  child: Text(
                    negativeText,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              : Container(),
          ElevatedButton(
            child: Text(
              positiveText,
            ),
            onPressed: () async {
              positiveFunction();
            },
          ),
        ],
      ),
    ),
  );
}

displaySucessDialog(context, title, subTitle) async {
  return await showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: colors.cardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(right: 15, left: 15, top: 30, bottom: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: texts.heading3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            CircleAvatar(
              radius: 40,
              backgroundColor: colors.lightGreyBackground,
              child: Icon(
                Ionicons.checkmark,
                color: colors.checkGreen,
                size: 50,
              ),
            ),
            const SizedBox(height: 30),
            Text(
              subTitle,
              style: texts.paragraphw,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    ),
  );
}

displayButtonDialogue(context, title, subTitle, onPress) async {
  return await showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: colors.cardBackgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(right: 15, left: 15, top: 30, bottom: 30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: texts.heading3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Text(
              subTitle,
              style: texts.paragraphw,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ReusableButton(onPress: () => {onPress}),
          ],
        ),
      ),
    ),
  );
}

displayQuitDialog(context, title, subTitle) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      backgroundColor: colors.cardBackgroundColor,
      title: Text(
        title,
        style: GoogleFonts.raleway(
            fontWeight: FontWeight.bold, color: colors.headingTextColor),
      ),
      content: Text(
        subTitle,
        style: GoogleFonts.raleway(
            color: colors.headingTextColor.withOpacity(0.8)),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text(
            "No",
          ),
          onPressed: () {
            Navigator.pop(context, false);
          },
        ),
        ElevatedButton(
          child: const Text(
            "Yes",
          ),
          onPressed: () async {
            Navigator.pop(context, true);
          },
        ),
      ],
    ),
  );
}
