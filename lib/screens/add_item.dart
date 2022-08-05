import 'package:flutter/material.dart';
import 'package:shopblocks_flutter/utils/custom_sliver_widget.dart';
import 'package:shopblocks_flutter/widgets/top_bar.dart';
import 'package:shopblocks_flutter/utils/colors.dart' as colors;


class AddItems extends StatefulWidget {
  const AddItems({Key? key}) : super(key: key);

  @override
  State<AddItems> createState() => _AddItemsState();
}

class _AddItemsState extends State<AddItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.scaffoldColor,
      body: CustomSliverView(columnList: [
        TopBar(title: 'Add Items', hasback: false),


      ],
      ),
    );
  }
}
