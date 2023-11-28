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


  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: widget.radioButtons
          .map(
            (button) => Padding(
              padding: const EdgeInsets.only(bottom: 8,),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: widget.isDisabled ? null : () {
                      setState(() {
                        widget.groupValue = button.code;
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
                            // borderRadius: BorderRadius.circular(2.0),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: widget.isDisabled ? const DigitColors().cloudGray :widget.groupValue == button.code ? const DigitColors().burningOrange : const DigitColors().davyGray,
                              width: 1.0,
                            ),
                            color: Colors.transparent,
                          ),
                          child: widget.groupValue == button.code ? Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: widget.isDisabled ? const DigitColors().cloudGray : const DigitColors().burningOrange,
                            ),
                          ) : null,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            button.name,
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Roboto'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
          .toList(),

    );
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
