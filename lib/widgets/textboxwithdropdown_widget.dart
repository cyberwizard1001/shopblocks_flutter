import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopblocks_flutter/utils/colors.dart' as colors;

class IncomeWithTypeTextField extends StatefulWidget {
  IncomeWithTypeTextField({
    Key? key,
    this.initialValue,
    required this.hintText,
    required this.onSaved,
    required this.text,
    this.validate,
    required this.listOfOptions,
    this.initialDropdownValue,
  }) : super(key: key);


  final initialValue;
  final String hintText;
  final String text;
  final String Function(String?)? validate;
  final List listOfOptions;
  final void Function(String?, String?) onSaved;
  final String? initialDropdownValue;

  @override
  State<IncomeWithTypeTextField> createState() =>
      _IncomeWithTypeTextFieldState();
}

class _IncomeWithTypeTextFieldState extends State<IncomeWithTypeTextField> {
  late String chosenOption;

  initState() {
    super.initState();
    chosenOption = widget.initialDropdownValue ??
        widget.listOfOptions[widget.listOfOptions.length - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: TextFormField(
              initialValue: widget.initialValue,
              keyboardType: TextInputType.number,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: GoogleFonts.raleway(color: colors.primaryTextColor),
              decoration: InputDecoration(
                filled: true,
                fillColor: colors.accentColor,
                focusColor: colors.accentColor,
                label: Text(
                  widget.text,
                  style:
                  GoogleFonts.raleway(color: colors.primaryTextColor),
                ),
                hintText: widget.hintText,
                hintStyle: GoogleFonts.raleway(color: colors.primaryTextColor,fontWeight: FontWeight.w400),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(5)),
                contentPadding: const EdgeInsets.all(7.0),
              ),
              validator: widget.validate ??
                      (value) {
                  },
              onSaved: (value) {
                widget.onSaved(value, chosenOption);
              },
            ),
          ),
          Expanded(
            flex: 2,
            child: Card(
              color: colors.accentColor,
              elevation: 0,
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: DropdownButton<dynamic>(
                    value: chosenOption,
                    dropdownColor: colors.accentColor,
                    isExpanded: true,
                    items: widget.listOfOptions.map<DropdownMenuItem>((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Container(
                          color: colors.accentColor,
                          child: Text(
                            value,
                            overflow: TextOverflow.ellipsis,
                          ),
                          padding: EdgeInsets.only(left: 8),
                        ),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        chosenOption = newValue;
                      });
                    },
                    style: GoogleFonts.poppins(
                        color: colors.primaryTextColor,
                        decorationColor: colors.buttonColor),
                  ),
                ),
              ),
            ),
          ),


        ],
      ),
    );
  }
}
