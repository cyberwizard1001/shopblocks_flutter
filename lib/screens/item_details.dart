import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:ionicons/ionicons.dart';
import 'package:shopblocks_flutter/utils/colors.dart' as colors;
import 'package:shopblocks_flutter/utils/text_styles.dart' as texts;
import 'package:shopblocks_flutter/utils/custom_sliver_widget.dart';
import 'package:shopblocks_flutter/widgets/top_bar.dart';
import 'package:web3dart/web3dart.dart';
import 'package:shopblocks_flutter/utils/constants.dart' as constants;

class ItemDetails extends StatefulWidget {
  const ItemDetails({Key? key}) : super(key: key);

  @override
  State<ItemDetails> createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  @override
  Widget build(BuildContext context) {
    Client httpClient;
    Web3Client? ethClient;

    @override
    void initState() {
      httpClient = Client();
      ethClient = Web3Client(constants.contractAddress, httpClient);
      super.initState();
    }

    return Scaffold(
      backgroundColor: colors.scaffoldColor,
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
          child: const Icon(Ionicons.checkmark),
        ),
      ),
      body: CustomSliverView(
        columnList: [
          TopBar(
            title: 'Item Name',
            hasback: true,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: colors.lightGreyBackground,
            ),
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 10, right: 10),
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
          Row(
            children: [
              Flexible(
                child: Text(
                  "Handcrafted table made from reclaimed teak wood and painted with organic dyes",
                  style: texts.heading3,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
