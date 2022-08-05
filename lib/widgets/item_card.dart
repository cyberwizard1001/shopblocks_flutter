import 'package:flutter/material.dart';
import 'package:shopblocks_flutter/utils/colors.dart' as colors;
import 'package:shopblocks_flutter/utils/text_styles.dart' as texts;
import 'alert_dialog.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO: Remove dialog testing
        // displayButtonDialogue(
        //   context,
        //   'A purchase has been initiated by the buyer',
        //   'Verify the transaction by clicking below,if the product has been sold.',
        //   () => {},
        // );
        displaySucessDialog(
          context,
          'Your purchase has been sent to the seller for verification',
          'Please wait for them to respond',
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: colors.lightGreyBackground,
              ),
              padding:
                  EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: const DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage("assets/images/test-carrot.png"),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Item Name',
            style: texts.paragraph.copyWith(
                fontWeight: FontWeight.w800, color: colors.headingTextColor),
          ),
          const SizedBox(height: 3),
          Text(
            'Price',
            style: texts.paragraph
                .copyWith(fontSize: 17, color: colors.headingTextColor),
          )
        ],
      ),
    );
  }
}
