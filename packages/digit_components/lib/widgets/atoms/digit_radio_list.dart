import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';

class DigitRadioList extends StatefulWidget {
  final List<RadioButtonModel> radioButtons;
  final void Function(String selectedValue)onChanged;
  String groupValue;
  final bool isDisabled;

  DigitRadioList({
    Key? key,
    required this.radioButtons,
    required this.onChanged,
    this.groupValue = '',
    this.isDisabled = false,
  }) : super(key: key);

  @override
  _DigitRadioListState createState() => _DigitRadioListState();
}

class _DigitRadioListState extends State<DigitRadioList> {
  late List<bool> isHoveredList;

  @override
  void initState() {
    super.initState();
    isHoveredList = List.generate(widget.radioButtons.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
        if (MediaQuery.of(context).size.width< 720) {
          // If the width is less than 600 (e.g., phone), display in a column
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _buildRadioButtons(),
          );
        } else {
          // If the width is 600 or more (e.g., larger screens), display in a row
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: _buildRadioButtons(),
          );
        }

  }

  List<Widget> _buildRadioButtons() {
    return widget.radioButtons.map(
          (button) {
        final index = widget.radioButtons.indexOf(button);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MouseRegion(
                onEnter: (_) {
                  setState(() {
                    isHoveredList[index] = true;
                  });
                },
                onExit: (_) {
                  setState(() {
                    isHoveredList[index] = false;
                  });
                },
                child: GestureDetector(
                  onTap: widget.isDisabled
                      ? null
                      : () {
                    setState(() {
                      widget.groupValue == button.code ? widget.groupValue = '' : widget.groupValue = button.code;
                    });
                    widget.onChanged!(widget.groupValue);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4.0),
                        width: 24, // Set width as needed
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: widget.isDisabled
                                ? const DigitColors().cloudGray
                                : (widget.groupValue == button.code ||
                                isHoveredList[index])
                                ? const DigitColors().burningOrange
                                : const DigitColors().davyGray,
                            width: 1.0,
                          ),
                          color: Colors.transparent,
                        ),
                        child: widget.groupValue == button.code
                            ? Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.isDisabled
                                ? const DigitColors().cloudGray
                                : const DigitColors().burningOrange,
                          ),
                        )
                            : null,
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          button.name,
                          style: TextStyle(
                            color: widget.isDisabled ? const DigitColors().cloudGray : const DigitColors().woodsmokeBlack,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Roboto'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    ).toList();
  }

}

class RadioButtonModel {
  final String code;
  final String name;

  RadioButtonModel({
    required this.code,
    required this.name,
  });
}
