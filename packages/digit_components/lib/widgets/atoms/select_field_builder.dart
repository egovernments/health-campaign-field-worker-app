import 'package:digit_components/widgets/atoms/digit_dropdown_mgram.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class SelectFieldBuilder extends StatefulWidget {
  final String labelText;
  final dynamic value;
  final String input;
  final String prefixText;
  final Function(dynamic) widget;
  final List<DropdownMenuItem<Object>> options;
  final bool isRequired;
  final String? hint;
  final bool? readOnly;
  final bool? isEnabled;
  final String? requiredMessage;
  final GlobalKey? contextKey;
  final TextEditingController? controller;
  final Key? key;
  final GlobalKey<DigitDropdownMgramState>? suggestionKey;

  const SelectFieldBuilder(this.labelText, this.value, this.input,
      this.prefixText, this.widget, this.options, this.isRequired,
      {this.hint,
      this.isEnabled,
      this.readOnly,
      this.requiredMessage,
      this.contextKey,
      this.controller,
      this.key,
      this.suggestionKey});

  @override
  State<SelectFieldBuilder> createState() => SelectFieldBuilderState();
}

class SelectFieldBuilderState extends State<SelectFieldBuilder> {
  var suggestionCtrl = SuggestionsBoxController();

  @override
  Widget build(BuildContext context) {
// Label Text
    Widget textLabelWidget =
        Wrap(direction: Axis.horizontal, children: <Widget>[
      Text(
        widget.labelText,
        textAlign: TextAlign.left,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      Visibility(
        visible: widget.isRequired,
        child: Text(
          widget.isRequired ? ' *' : '',
        ),
      ),
    ]);

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 760) {
        return Container(
          key: widget.contextKey,
          margin:
              const EdgeInsets.only(top: 5.0, bottom: 5, right: 20, left: 20),
          child: Row(children: [
            Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width / 3,
                padding: const EdgeInsets.only(top: 18, bottom: 3),
                child: textLabelWidget),
            Container(
                width: MediaQuery.of(context).size.width / 2.5,
                padding: const EdgeInsets.only(top: 18, bottom: 3),
                child: Column(
                  children: [
                    DigitDropdownMgram(
                        widget.labelText,
                        widget.options,
                        widget.controller,
                        widget.widget,
                        widget.value,
                        widget.isEnabled,
                        widget.isRequired,
                        widget.requiredMessage,
                        key: widget.suggestionKey),
                  ],
                )),
          ]),
        );
      } else {
        return Container(
          key: widget.contextKey,
          margin: const EdgeInsets.only(top: 5.0, bottom: 5, right: 8, left: 8),
          child: Column(children: [
            Container(
                padding: const EdgeInsets.only(top: 18, bottom: 3),
                child: Align(
                    alignment: Alignment.centerLeft, child: textLabelWidget)),
            DigitDropdownMgram(
              widget.labelText,
              widget.options,
              widget.controller,
              widget.widget,
              widget.value,
              widget.isEnabled,
              widget.isRequired,
              widget.requiredMessage,
              key: widget.suggestionKey,
            )
          ]),
        );
      }
    });
  }
}
