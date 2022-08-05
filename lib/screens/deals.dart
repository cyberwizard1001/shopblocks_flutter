import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopblocks_flutter/utils/colors.dart' as colors;
import 'package:shopblocks_flutter/utils/text_styles.dart' as texts;
import 'package:shopblocks_flutter/widgets/alert_dialog.dart';
import 'package:shopblocks_flutter/widgets/top_bar.dart';

class Deals extends StatefulWidget {
  const Deals({Key? key}) : super(key: key);

  @override
  State<Deals> createState() => _DealsState();
}

class _DealsState extends State<Deals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: colors.primaryColor,
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                color: colors.primaryColor.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 10,
              ),
            ],
          ),
          child: Icon(Icons.add),
        ),
      ),
      backgroundColor: colors.scaffoldColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(
              hasback: false,
              onChanged: (value) {
                //TODO: do something if it screen changes
              },
              title: 'Deals',
            ),
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05,
                left: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "TRENDING",
                    style: texts.heading3,
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 25,
                    ),
                    itemBuilder: (context, i) {
                      return const ItemCard();
                    },
                    itemCount: 4,
                  )
                ],
              ),
            ),
            const SizedBox(height: 70),
            Padding(
              padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.05,
                left: MediaQuery.of(context).size.width * 0.05,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ALL PRODUCTS",
                    style: texts.heading3,
                  ),
                  GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 25,
                      mainAxisSpacing: 25,
                    ),
                    itemBuilder: (context, i) {
                      return const ItemCard();
                    },
                    itemCount: 6,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        displaySucessDialog(
            context,
            'Your purchase has been sent to the seller for verification',
            'Please wait for them to respond');
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
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
