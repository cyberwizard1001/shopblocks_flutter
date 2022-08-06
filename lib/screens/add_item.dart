import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopblocks_flutter/utils/custom_sliver_widget.dart';
import 'package:shopblocks_flutter/widgets/dropdown_widget.dart';
import 'package:shopblocks_flutter/widgets/textbox_widget.dart';
import 'package:shopblocks_flutter/widgets/textboxwithdropdown_widget.dart';
import 'package:shopblocks_flutter/widgets/time_picker.dart';
import 'package:shopblocks_flutter/widgets/top_bar.dart';
import 'package:shopblocks_flutter/utils/colors.dart' as colors;
import 'package:shopblocks_flutter/utils/text_styles.dart' as texts;

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
      body: CustomSliverView(
        columnList: [
          const TopBar(title: 'Add Items', hasback: true),
          Expanded(
            flex: 1,
            child: Container(),
          ),
          Expanded(
            flex: 20,
            child: Column(
              children: [
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: colors.primaryColor,
                        shape: RoundedRectangleBorder(
                            side: BorderSide.none,
                            borderRadius: BorderRadius.circular(8.0))),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, left: 20.0, right: 20.0),
                      child: Text(
                        'Attach an image',
                        style: texts.button,
                      ),
                    )),
                const Padding(
                  padding: EdgeInsets.only(
                      top: 50.0, left: 20.0, right: 20.0, bottom: 20.0),
                  child: TextBoxField(
                    hint: 'Enter item name here',
                    light: false,
                    title: 'ITEM NAME',
                    padding: EdgeInsets.zero,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 10.0),
                  child: DropDownFormField(list: const [
                    'Vegetables',
                    'Fruits',
                    'Grains',
                    'Craft',
                    'Machinery'
                  ], title: 'CATEGORY', hint: 'Select your category'),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10.0),
                  child: IncomeWithTypeTextField(
                    listOfOptions: const [
                      'Number',
                      'Grams',
                      'Kilograms',
                      'Litres',
                      'Meters'
                    ],
                    hintText: 'Enter quantity',
                    text: 'QUANTITY',
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: TextBoxField(
                    hint: 'Enter cost of item here',
                    light: false,
                    title: 'COST/UNIT',
                    padding: EdgeInsets.zero,
                  ),
                ),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: TextBoxField(
                    hint: 'Enter location of availability here',
                    light: false,
                    title: 'LOCATION',
                    padding: EdgeInsets.zero,
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20.0),
                    child: TimePickerWidget(
                      context: context,
                    )),
                const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: TextBoxField(
                    hint: 'Enter description here',
                    light: false,
                    title: 'DESCRIPTION',
                    padding: EdgeInsets.zero,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 50),
                  child: ElevatedButton(
                    onPressed: () {},
                    style:
                        ElevatedButton.styleFrom(primary: colors.primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 8.0),
                      child: Text(
                        'Add item to cart',
                        style: texts.button,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
