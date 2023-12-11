import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';


class DigitMultiSelectDropdown<T> extends StatefulWidget {
  /// the child widget for the button, this will be ignored if text is supplied
  final Widget child;
  final TextEditingController textEditingController;

  /// onChange is called when the selected option is changed.;
  /// It will pass back the value and the index of the option.
  final void Function(String, int) onChange;

  /// list of DropdownItems
  final List<DropdownItem<String>> items;
  final DropdownStyle dropdownStyle;
  final List<DropdownItemType<T>> types;
  /// dropdownButtonStyles passes styles to OutlineButton.styleFrom()
  final DropdownButtonStyle dropdownButtonStyle;

  /// dropdown button icon defaults to caret
  final Icon? icon;
  final bool hideIcon;

  /// if true the dropdown icon will as a leading icon, default to false
  final bool leadingIcon;
  const DigitMultiSelectDropdown({
    Key? key,
    this.hideIcon = false,
    required this.child,
    required this.items,
    required this.types,
    this.dropdownStyle = const DropdownStyle(),
    this.dropdownButtonStyle = const DropdownButtonStyle(),
    this.icon,
    this.leadingIcon = false,
    required this.onChange,
    required this.textEditingController,
  }) : super(key: key);

  @override
  _DigitMultiSelectDropdownState<T> createState() => _DigitMultiSelectDropdownState<T>();
}

class _DigitMultiSelectDropdownState<T> extends State<DigitMultiSelectDropdown<T>>
    with TickerProviderStateMixin {
  final LayerLink _layerLink = LayerLink();
  late OverlayEntry _overlayEntry;
  bool _isOpen = false;
  int _currentIndex = -1;
  late List<DropdownItem<String>> filteredItems;
  late List<DropdownItem<String>> _lastFilteredItems;
  late List<String> selectedValues; // Add this property
  late List<int> selectedIndices;

  @override
  void initState() {
    super.initState();
    selectedValues = [];
    selectedIndices = [];
    filteredItems = List.from(widget.items);
    _lastFilteredItems = List.from(widget.items);
  }

  @override
  Widget build(BuildContext context) {
    var style = widget.dropdownButtonStyle;
    // link the overlay to the button
    return CompositedTransformTarget(
      link: this._layerLink,
      child: Column(
        children: [
          Container(
            width: style.width,
            height: style.height,
            child: TextField(
              onTap: _toggleDropdown,
              onChanged: (input) {
                _filterItems(input);
                if (!listEquals(filteredItems, _lastFilteredItems)) {
                  _updateOverlay();
                  _lastFilteredItems = filteredItems;
                }
              },
              controller: widget.textEditingController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: const DigitColors().burningOrange, width: 1.0),
                  borderRadius: BorderRadius.zero,
                ),
                contentPadding: style.padding ?? const EdgeInsets.only(left: 8,),
                suffixIcon: const Icon(Icons.search),
                suffixIconColor: const DigitColors().davyGray,
              ),
            ),
          ),
          if (selectedValues.isNotEmpty)
            Wrap(
              spacing: 8.0, // Adjust the spacing between chips
              children: selectedValues.map((value) {
                var typeName = '';

                int index = int.tryParse(value) ?? -1;

                for (var type in widget.types) {
                  print(type.values);

                  if (type.values.contains(type.values[index])) {
                    setState(() {
                      typeName = type.type;
                    });
                    break;
                  }
                }
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (typeName.isNotEmpty)
                      Container(
                        margin: EdgeInsets.only(right: 8.0),
                        child: Text(
                          typeName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    Chip(
                      label: Text(value),
                      onDeleted: () {
                        _removeSelectedValue(value);
                      },
                    ),
                  ],
                );
              }).toList(),
            ),
        ],
      ),
    );
  }



  void _removeSelectedValue(String value) {
    setState(() {
      selectedValues.remove(value);
    });
  }

  void _filterItems(String input) {
    List<DropdownItem<String>> newFilteredItems = widget.items
        .where((item) => item.value.toLowerCase().contains(input.toLowerCase()))
        .toList();

    if (!listEquals(newFilteredItems, _lastFilteredItems)) {
      setState(() {
        filteredItems = newFilteredItems;
      });
    }
  }

  void _updateOverlay() {
    if (_isOpen && _overlayEntry != null) {
      _overlayEntry!.remove();
      _overlayEntry = _createOverlayEntry();
      Overlay.of(context)!.insert(_overlayEntry!);
    }
  }

  OverlayEntry _createOverlayEntry() {
    // find the size and position of the current widget
    RenderBox? renderBox = context?.findRenderObject() as RenderBox?;
    OverlayEntry? _overlayEntry;

    if (renderBox == null) {
      // Handle the case where renderBox is null (e.g., widget not yet laid out)
      return OverlayEntry(builder: (context) => const SizedBox.shrink());
    }
    var size = renderBox.size;

    var offset = renderBox.localToGlobal(Offset.zero);
    var topOffset = offset.dy + size.height + 5;
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: () => _toggleDropdown(close: true),
        behavior: HitTestBehavior.translucent,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: [
              Positioned(
                left: offset.dx,
                top: topOffset,
                width: widget.dropdownStyle.width ?? size.width,
                child: CompositedTransformFollower(
                  offset: widget.dropdownStyle.offset ?? Offset(0, size.height + 5),
                  link: this._layerLink,
                  showWhenUnlinked: false,
                  child: Material(
                    elevation: widget.dropdownStyle.elevation ?? 0,
                    borderRadius: widget.dropdownStyle.borderRadius ?? BorderRadius.zero,
                    color: widget.dropdownStyle.color,
                    child: ConstrainedBox(
                      constraints: widget.dropdownStyle.constraints ??
                          BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height -
                                topOffset -
                                15,
                          ),
                      child: ListView(
                        padding: widget.dropdownStyle.padding ?? EdgeInsets.zero,
                        shrinkWrap: true,
                        children: widget.types
                            .asMap()
                            .entries
                            .expand((typeEntry) {
                          return [
                            // Type widget
                            ListTile(
                              title: Text(typeEntry.value.type),
                              onTap: null,
                            ),
                            // Values widgets
                            ...typeEntry.value.values.asMap().entries.map((valueEntry) {
                              return InkWell(
                                onTap: () {
                                  setState(() => _currentIndex = valueEntry.key);
                                  widget.onChange(valueEntry.value, valueEntry.key);
                                  _toggleDropdown();
                                },
                                child: DropdownItem<String>(
                                  value: valueEntry.value,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(valueEntry.value),
                                  ),
                                ),
                              );
                            }).toList(),
                          ];
                        })
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return overlayEntry;
  }

  void _toggleDropdown({bool close = false}) async {
    if (_isOpen || close) {
      _overlayEntry?.remove();
      setState(() {
        _isOpen = false;
      });
    } else {
      setState(() {
        _currentIndex = -1; // Reset the index when opening the dropdown
        _overlayEntry = _createOverlayEntry();
      });
      Overlay.of(context).insert(_overlayEntry!);
      setState(() => _isOpen = true);
    }
    if (_currentIndex != -1) {
      setState(() {
        if (selectedIndices.contains(_currentIndex)) {
          // If already selected, remove it
          print(_currentIndex.toString());
          selectedIndices.remove(_currentIndex);
          selectedValues.remove(_currentIndex);
        } else {
          // If not selected, add it
          selectedIndices.add(_currentIndex);
          selectedValues.add(_currentIndex.toString());
        }
      });
    }
  }
}

/// DropdownItem is just a wrapper for each child in the dropdown list.\n
/// It holds the value of the item.
class DropdownItem<String> extends StatelessWidget {
  final String value;
  final Widget child;

  const DropdownItem({Key? key, required this.value, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return child;
  }
}

class DropdownButtonStyle {
  final MainAxisAlignment? mainAxisAlignment;
  final ShapeBorder? shape;
  final double elevation;
  final Color backgroundColor;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;
  final double width;
  final double height;
  final Color primaryColor;
  const DropdownButtonStyle({
    this.mainAxisAlignment,
    this.backgroundColor=Colors.white,
    this.primaryColor = Colors.black87,
    this.constraints,
    this.height = 40,
    this.width = 340,
    this.elevation = 1,
    this.padding,
    this.shape,
  });
}

class DropdownItemType<T> {
  final String type;
  final List<String> values;

  const DropdownItemType({required this.type, required this.values});
}

class DropdownStyle {
  final BorderRadius borderRadius;
  final double? elevation;
  final Color? color;
  final EdgeInsets? padding;
  final BoxConstraints? constraints;

  /// position of the top left of the dropdown relative to the top left of the button
  final Offset? offset;

  ///button width must be set for this to take effect
  final double? width;

  const DropdownStyle({
    this.constraints,
    this.offset,
    this.width,
    this.elevation,
    this.color,
    this.padding,
    this.borderRadius = BorderRadius.zero,
  });
}