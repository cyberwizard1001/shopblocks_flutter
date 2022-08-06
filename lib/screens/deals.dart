import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shopblocks_flutter/models/itemModel.dart';
import 'package:shopblocks_flutter/screens/add_item.dart';
import 'package:shopblocks_flutter/screens/item_details.dart';
import 'package:shopblocks_flutter/utils/colors.dart' as colors;
import 'package:shopblocks_flutter/utils/text_styles.dart' as texts;
import 'package:shopblocks_flutter/widgets/top_bar.dart';

import '../widgets/item_card.dart';

import 'package:shopblocks_flutter/utils/testProduct.json' as test;

class Deals extends StatefulWidget {
  const Deals({Key? key}) : super(key: key);

  @override
  State<Deals> createState() => _DealsState();
}

class _DealsState extends State<Deals> {
  String status = "";

  // List testJsonProd = Factory(constructor);

  // ItemModel testProd = new ItemModel(pid: test[], itemName: itemName, itemType: itemType, itemPrice: itemPrice, location: location, availableCount: availableCount, description: description, timeOfAvailability: timeOfAvailability, imageId: imageId)

  @override
  void initState() {
    super.initState();
    var reference = FirebaseDatabase.instance.ref('order_status');
    reference.onValue.listen((DatabaseEvent event) {
      setState(() {
        status = event.snapshot.value.toString();

        // if (status == '') {}
        // else if( status == '')
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddItems()));
        },
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
          child: const Icon(Icons.add),
        ),
      ),
      backgroundColor: colors.scaffoldColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Text(
            //   status,
            //   style: texts.heading1,
            // ),
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
                  const SizedBox(
                    height: 10,
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
                      return ItemCard(
                        onPress: () {},
                      );
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
                  const SizedBox(
                    height: 10,
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
                      return ItemCard(
                        onPress: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ItemDetails()));
                        },
                      );
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
