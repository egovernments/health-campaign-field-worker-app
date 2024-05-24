import 'package:flutter/material.dart';
import 'package:flutter_focus_watcher/flutter_focus_watcher.dart';
import 'package:provider/provider.dart';

class DigitDropdownMgram extends StatefulWidget {
  final String labelText;
  final List<DropdownMenuItem<Object>> options;
  final dynamic value;
  final Function(dynamic) widget;
  final bool? isEnabled;
  final bool isRequired;
  final String? requiredMessage;
  final TextEditingController? controller;

  const DigitDropdownMgram(
    this.labelText,
    this.options,
    this.controller,
    this.widget,
    this.value,
    this.isEnabled,
    this.isRequired,
    this.requiredMessage, {
    Key? key,
  }) : super(key: key);

  @override
  DigitDropdownMgramState createState() => DigitDropdownMgramState();
}

class DigitDropdownMgramState extends State<DigitDropdownMgram> {
  final FocusNode _focusNode = FocusNode();
  bool isInit = false;
  var selectedCode;
  List<DropdownMenuItem<Object>> Options = [];
  late OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        this._overlayEntry = this._createOverlayEntry();
        Overlay.of(context)!.insert(this._overlayEntry);
      } else {
        this._overlayEntry.remove();
      }
    });
    WidgetsBinding.instance!.addPostFrameCallback((_) => afterViewBuild());
    super.initState();
    filerobjects("");
  }

  afterViewBuild() {
    var res = widget.options.where((e) => (e.value == (widget.value)));
    if (res.isNotEmpty && _focusNode.hasFocus == false) {
      widget.controller?.text = (res.first.child as Text).data.toString();
    }
  }

  filerobjects(val) {
    if (val != "") {
      setState(() {
        isInit = true;
        Options = widget.options
            .where((element) => (element.child as Text)
                .data
                .toString()
                .toLowerCase()
                .contains(val.toString().toLowerCase()))
            .toList();
      });
    } else {
      setState(() {
        Options = widget.options;
      });
    }
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;

    var size = renderBox!.size;

    return OverlayEntry(
        builder: (context) => Positioned(
            width: size.width,
            child: CompositedTransformFollower(
              link: this._layerLink,
              showWhenUnlinked: true,
              offset: Offset(0.0, size.height),
              child: Material(
                elevation: 4.0,
                child: Container(
                  height: Options.length == 0 && isInit == false
                      ? (widget.options.length * 50 < 150
                          ? widget.options.length * 50
                          : 150)
                      : (Options.length * 50 < 150 ? Options.length * 50 : 150),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    children: <Widget>[
                      for (var item in Options.length == 0 && isInit == false
                          ? widget.options
                          : Options)
                        Ink(
                            color: Colors.white,
                            child: ListTile(
                              title: Text((item.child as Text).data.toString()),
                              onTap: () {
                                Text txt = item.child as Text;
                                widget.widget(item.value);
                                setState(() {
                                  selectedCode = item.value;
                                });
                                widget.controller?.text = txt.data.toString();
                                _focusNode.unfocus();
                              },
                            )),
                    ],
                  ),
                ),
              ),
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 0,
      ),
      CompositedTransformTarget(
        link: this._layerLink,
        child: ForceFocusWatcher(
          child: TextFormField(
            style: Theme.of(context).textTheme.bodyLarge,
            controller: widget.controller,
            onChanged: (value) => filerobjects(value),
            focusNode: this._focusNode,
            validator: (value) {
              if ((value ?? '').trim().isEmpty && !widget.isRequired) {
                return null;
              } else if (value!.isEmpty && widget.isRequired) {
                return widget.requiredMessage ?? '${widget.labelText}_REQUIRED';
              } else if (widget.options
                  .where((element) =>
                      (element.child as Text).data.toString().toLowerCase() ==
                      (value.toString().toLowerCase()))
                  .toList()
                  .isEmpty) {
                return widget.requiredMessage ?? 'INVALID_SELECTED_INPUT';
              }
              if (value.trim().isEmpty && widget.isRequired) {
                return widget.requiredMessage ?? '${widget.labelText}_REQUIRED';
              }
              return null;
            },
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.arrow_drop_down),
              errorMaxLines: 2,
              enabled: widget.isEnabled ?? true,
              fillColor: widget.isEnabled != null && widget.isEnabled!
                  ? Colors.grey
                  : Colors.white,
              prefixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
            ),
          ),
        ),
      ),
    ]);
  }
}
