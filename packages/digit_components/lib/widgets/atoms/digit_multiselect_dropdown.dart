library multiselect_dropdown;
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'digit_checkbox_icon.dart';

typedef OnOptionSelected<T> = void Function(List<DropdownListItem<T>> selectedOptions);

class MultiSelectDropDown<int> extends StatefulWidget {
  // selection type of the dropdown
  final SelectionType selectionType;

  // Options
  final List<DropdownListItem<int>> options;
  final List<DropdownListItem<int>> selectedOptions;
  final List<DropdownListItem<int>> disabledOptions;
  final OnOptionSelected<int>? onOptionSelected;

  // selected option
  final Icon? selectedOptionIcon;
  final Color? selectedOptionTextColor;
  final Color? selectedOptionBackgroundColor;
  final Widget Function(BuildContext, DropdownListItem<int>)? selectedItemBuilder;

  // chip configuration
  final bool showChipInSingleSelectMode;
  // final ChipConfig chipConfig;

  // options configuration
  final Color? optionsBackgroundColor;
  final TextStyle? optionTextStyle;
  final double dropdownHeight;
  final Widget? optionSeparator;
  final bool alwaysShowOptionIcon;

  // dropdownfield configuration
  final Color? backgroundColor;
  final Icon? suffixIcon;
  final Icon? clearIcon;
  final Decoration? inputDecoration;
  final double? borderRadius;
  final BorderRadiusGeometry? radiusGeometry;
  final Color? borderColor;
  final Color? focusedBorderColor;
  final double? borderWidth;
  final double? focusedBorderWidth;
  final EdgeInsets? padding;
  final bool showClearIcon;
  final int? maxItems;

  /// focus node
  final FocusNode? focusNode;

  /// Controller for the dropdown
  /// [controller] is the controller for the dropdown. It can be used to programmatically open and close the dropdown.
  final MultiSelectController<int>? controller;

  final bool searchEnabled;

  const MultiSelectDropDown(
      {Key? key,
        required this.onOptionSelected,
        required this.options,
        this.selectedOptionTextColor,
        // this.chipConfig = const ChipConfig(),
        this.selectionType = SelectionType.multi,
        this.selectedOptions = const [],
        this.disabledOptions = const [],
        this.alwaysShowOptionIcon = false,
        this.optionTextStyle,
        this.selectedOptionIcon = const Icon(Icons.check),
        this.selectedOptionBackgroundColor,
        this.optionsBackgroundColor,
        this.backgroundColor = Colors.white,
        this.dropdownHeight = 200,
        this.showChipInSingleSelectMode = false,
        this.suffixIcon = const Icon(Icons.arrow_drop_down),
        this.clearIcon = const Icon(Icons.close_outlined, size: 14),
        this.selectedItemBuilder,
        this.optionSeparator,
        this.inputDecoration,
        this.padding,
        this.focusedBorderColor = Colors.black54,
        this.borderColor = Colors.grey,
        this.borderWidth = 0.4,
        this.focusedBorderWidth = 0.4,
        this.borderRadius = 12.0,
        this.radiusGeometry,
        this.showClearIcon = true,
        this.maxItems,
        this.focusNode,
        this.controller,
        this.searchEnabled = false,})
      :super(key: key);

  @override
  State<MultiSelectDropDown<int>> createState() => _MultiSelectDropDownState<int>();
}

class _MultiSelectDropDownState<T> extends State<MultiSelectDropDown<T>> {
  /// Options list that is used to display the options.
  final List<DropdownListItem<T>> _options = [];

  /// Selected options list that is used to display the selected options.
  final List<DropdownListItem<T>> _selectedOptions = [];

  /// Disabled options list that is used to display the disabled options.
  final List<DropdownListItem<T>> _disabledOptions = [];

  /// The controller for the dropdown.
  OverlayState? _overlayState;
  OverlayEntry? _overlayEntry;
  bool _selectionMode = false;

  late final FocusNode _focusNode;
  final LayerLink _layerLink = LayerLink();

  /// value notifier that is used for controller.
  MultiSelectController<T>? _controller;

  /// search field focus node
  FocusNode? _searchFocusNode;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialize();
    });
    _focusNode = widget.focusNode ?? FocusNode();
    _controller = widget.controller ?? MultiSelectController<T>();
  }

  void _initialize(){
    if (!mounted) return;
    _addOptions();
    _overlayState ??= Overlay.of(context);
    _focusNode.addListener(_handleFocusChange);

    if (widget.searchEnabled) {
      _searchFocusNode = FocusNode();
      _searchFocusNode!.addListener(_handleFocusChange);
    }
  }

  /// Adds the selected options and disabled options to the options list.
  void _addOptions() {
    setState(() {
      // _selectedOptions.addAll(_controller?.selectedOptions.isNotEmpty == true
      //     ? _controller!.selectedOptions
      //     : widget.selectedOptions);
      // _disabledOptions.addAll(_controller?.disabledOptions.isNotEmpty == true
      //     ? _controller!.disabledOptions
      //     : widget.disabledOptions);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_controller != null && _controller?._isDisposed == false) {
        _controller!.setOptions(_options);
        _controller!.setSelectedOptions(_selectedOptions);
        _controller!.setDisabledOptions(_disabledOptions);

        _controller!.addListener(_handleControllerChange);
      }
    });
  }

  /// Handles the focus change to show/hide the dropdown.
  _handleFocusChange() {
    if (_focusNode.hasFocus && mounted) {
      _overlayEntry = _buildOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
      return;
    }

    if ((_searchFocusNode == null || _searchFocusNode?.hasFocus == false) &&
        _overlayEntry != null) {
      _overlayEntry?.remove();
    }

    if (mounted) {
      setState(() {
        _selectionMode =
            _focusNode.hasFocus || _searchFocusNode?.hasFocus == true;
      });
    }

    if (_controller != null) {
      _controller!.value._isDropdownOpen =
          _focusNode.hasFocus || _searchFocusNode?.hasFocus == true;
    }
  }

  /// Handles the widget rebuild when the options are changed externally.
  @override
  void didUpdateWidget(covariant MultiSelectDropDown<T> oldWidget) {
    if (widget.controller == null && oldWidget.controller != null) {
      _controller = MultiSelectController<T>();
    } else if (widget.controller != null && oldWidget.controller == null) {
      _controller!.dispose();
      _controller = null;
    }

    // If the options are changed externally, then the options are updated.
    if (listEquals(widget.options, oldWidget.options) == false) {
      _options.clear();
      _options.addAll(widget.options);

      // If the controller is not null, then the options are updated in the controller.
      if (_controller != null) {
        _controller!.setOptions(_options);
      }
    }

    // If the selected options are changed externally, then the selected options are updated.
    if (listEquals(widget.selectedOptions, oldWidget.selectedOptions) ==
        false) {
      _selectedOptions.clear();
      _selectedOptions.addAll(widget.options
          .where((element) => widget.selectedOptions.contains(element)));

      // If the controller is not null, then the selected options are updated in the controller.
      if (_controller != null) {
        _controller!.setSelectedOptions(_selectedOptions);
      }
    }

    // If the disabled options are changed externally, then the disabled options are updated.
    if (listEquals(widget.disabledOptions, oldWidget.disabledOptions) ==
        false) {
      _disabledOptions.clear();
      _disabledOptions.addAll(widget.options
          .where((element) => widget.disabledOptions.contains(element)));

      // If the controller is not null, then the disabled options are updated in the controller.
      if (_controller != null) {
        _controller!.setDisabledOptions(_disabledOptions);
      }
    }

    super.didUpdateWidget(oldWidget);
  }

  /// Calculate offset size for dropdown.
  List _calculateOffsetSize() {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;

    var size = renderBox?.size ?? Size.zero;
    var offset = renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;

    final availableHeight = MediaQuery.of(context).size.height - offset.dy;

    return [size, availableHeight < widget.dropdownHeight];
  }

  @override
  Widget build(BuildContext context) {

    double dropdownWidth = MediaQuery.of(context).size.width < 600 ? 340 : 600;
    return CompositedTransformTarget(
      link: _layerLink,
      child: Focus(
        canRequestFocus: true,
        skipTraversal: true,
        focusNode: _focusNode,
        child: InkWell(
          splashColor: null,
          splashFactory: null,
          onTap: _toggleFocus,
          child: Container(
            height:  40,
            width: dropdownWidth,
            constraints: const BoxConstraints(
              minWidth: 340,
              minHeight: 40,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
            decoration: _getContainerDecoration(),
            child: Row(
              children: [
                Expanded(
                  child: _getContainerContent(),
                ),
                if (widget.showClearIcon && _anyItemSelected) ...[
                  const SizedBox(width: 4),
                  InkWell(
                    onTap: () => clear(),
                    child: const Icon(
                      Icons.close_outlined,
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 4)
                ],
                if (!_selectionMode)
                  AnimatedRotation(
                    turns: _selectionMode ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: widget.suffixIcon,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Container Content for the dropdown.
  Widget _getContainerContent() {
    if (_selectedOptions.isEmpty) {
      return const Text('select items to show here');
    }
    return const Text('need to work');
    // return _buildSelectedItems();
  }

  /// return true if any item is selected.
  bool get _anyItemSelected => _selectedOptions.isNotEmpty;

  /// Container decoration for the dropdown.
  Decoration _getContainerDecoration() {
    return BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.zero,
          border: _selectionMode
              ? Border.all(
            color: widget.focusedBorderColor ?? const DigitColors().burningOrange,
            width: widget.focusedBorderWidth ?? 1,
          )
              : Border.all(
            color: const DigitColors().davyGray,
            width: widget.borderWidth ?? 1,
          ),
        );
  }

  /// Dispose the focus node and overlay entry.
  @override
  void dispose() {
    if (_overlayEntry?.mounted == true) {
      if (_overlayState != null && _overlayEntry != null) {
        _overlayEntry?.remove();
      }
      _overlayEntry = null;
      _overlayState?.dispose();
    }
    _focusNode.removeListener(_handleFocusChange);
    _searchFocusNode?.removeListener(_handleFocusChange);
    _focusNode.dispose();
    _searchFocusNode?.dispose();
    _controller?.removeListener(_handleControllerChange);

    if (widget.controller == null || widget.controller?.isDisposed == true) {
      _controller!.dispose();
    }

    super.dispose();
  }

  /// Util method to map with index.
  Iterable<E> mapIndexed<E, F>(
      Iterable<F> items, E Function(int index, F item) f) sync* {
    var index = 0;

    for (final item in items) {
      yield f(index, item);
      index = index + 1;
    }
  }

  /// Handle the focus change on tap outside of the dropdown.
  void _onOutSideTap() {
    if (_searchFocusNode != null) {
      _searchFocusNode!.unfocus();
    }
    _focusNode.unfocus();
  }

  /// Method to toggle the focus of the dropdown.
  void _toggleFocus() {
    if (_focusNode.hasFocus) {
      _focusNode.unfocus();
    } else {
      _focusNode.requestFocus();
    }
  }

  /// Create the overlay entry for the dropdown.
  OverlayEntry _buildOverlayEntry() {
    // Calculate the offset and the size of the dropdown button
    final values = _calculateOffsetSize();
    // Get the size from the first item in the values list
    final size = values[0] as Size;
    // Get the showOnTop value from the second item in the values list
    final showOnTop = values[1] as bool;

    return OverlayEntry(builder: (context) {
      List<DropdownListItem<T>> options = [DropdownListItem(value: 1, label: 'first'), DropdownListItem(value: 2, label: 'second')];
      List<DropdownListItem<T>> selectedOptions = [..._selectedOptions];
      final searchController = TextEditingController();

      return StatefulBuilder(builder: ((context, dropdownState) {
        return Stack(
          children: [
            Positioned.fill(
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: _onOutSideTap,
                  child: Container(
                    color: Colors.transparent,
                  ),
                )),
            CompositedTransformFollower(
              link: _layerLink,
              showWhenUnlinked: false,
              targetAnchor:
              Alignment.bottomLeft,
              followerAnchor:
              Alignment.topLeft,
              offset: Offset.zero,
              child: Material(
                  borderRadius: BorderRadius.zero,
                  // elevation: 4,
                  shadowColor: Colors.black,
                  child: Container(
                    constraints: widget.searchEnabled
                        ? BoxConstraints.loose(
                        Size(size.width,  50))
                        : BoxConstraints.loose(
                        Size(size.width, 100)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.searchEnabled) ...[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextFormField(
                              controller: searchController,
                              onTapOutside: (_) {},
                              scrollPadding: EdgeInsets.only(
                                  bottom:
                                  MediaQuery.of(context).viewInsets.bottom),
                              focusNode: _searchFocusNode,
                              decoration: InputDecoration(
                                fillColor: Colors.grey.shade200,
                                isDense: true,
                                hintText: 'Search',
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade300,
                                    width: 0.8,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  borderSide: BorderSide(
                                    color: Theme.of(context).primaryColor,
                                    width: 0.8,
                                  ),
                                ),
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.close),
                                  onPressed: () {
                                    searchController.clear();
                                    dropdownState(() {
                                      options = _options;
                                    });
                                  },
                                ),
                              ),
                              onChanged: (value) {
                                dropdownState(() {
                                  options = _options
                                      .where((element) => element.label
                                      .toLowerCase()
                                      .contains(value.toLowerCase()))
                                      .toList();
                                });
                              },
                            ),
                          ),
                          const Divider(
                            height: 1,
                          ),
                        ],
                        Expanded(
                          child: ListView.separated(
                            separatorBuilder: (_, __) =>
                            widget.optionSeparator ??
                                const SizedBox(height: 0),
                            shrinkWrap: true,
                            padding: EdgeInsets.zero,
                            itemCount: options.length,
                            itemBuilder: (context, index) {
                              final option = options[index];
                              final isSelected =
                              selectedOptions.contains(option);
                              final primaryColor =
                                  Theme.of(context).primaryColor;

                              return _buildOption(option, primaryColor,
                                  isSelected, dropdownState, selectedOptions);
                            },
                          ),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        );
      }));
    });
  }

  ListTile _buildOption(
      DropdownListItem<T> option,
      Color primaryColor,
      bool isSelected,
      StateSetter dropdownState,
      List<DropdownListItem<T>> selectedOptions) {
    return ListTile(
        title:  Row(
          children: [
            if (isSelected)
              DigitCheckboxIcon(state: CheckboxState.checked),
            if (!isSelected)
              DigitCheckboxIcon(state: CheckboxState.unchecked),
            Text(option.label),
          ],
        ),
        textColor: const DigitColors().woodsmokeBlack,
        focusColor: Colors.red,
        selectedColor: widget.selectedOptionTextColor ?? primaryColor,
        selected: isSelected,
        autofocus: true,
        dense: true,
        tileColor: widget.optionsBackgroundColor ?? Colors.white,
        selectedTileColor:
        widget.selectedOptionBackgroundColor ?? Colors.grey.shade200,
        enabled: !_disabledOptions.contains(option),
        onTap: () {
          if (widget.selectionType == SelectionType.multi) {
            if (isSelected) {
              dropdownState(() {
                selectedOptions.remove(option);
              });
              setState(() {
                _selectedOptions.remove(option);
              });
            }
          }

          if (_controller != null) {
            _controller!.value._selectedOptions.clear();
            _controller!.value._selectedOptions.addAll(_selectedOptions);
          }
          widget.onOptionSelected?.call(_selectedOptions);
        },
    );
  }

  /// Clear the selected options.
  /// [MultiSelectController] is used to clear the selected options.
  void clear() {
    if (_controller != null && !_controller!._isDisposed) {
      _controller!.clearAllSelection();
    } else {
      setState(() {
        _selectedOptions.clear();
      });
      widget.onOptionSelected?.call(_selectedOptions);
    }
    if (_focusNode.hasFocus) _focusNode.unfocus();
  }

  /// handle the controller change.
  void _handleControllerChange() {
    // if the controller is null, return.
    if (_controller == null || _controller?.isDisposed == true) return;

    // if current options are not equal to the controller's options, update the state.
    if (_options != _controller!.value._options) {
      setState(() {
        _options.clear();
        _options.addAll(_controller!.value._options as Iterable<DropdownListItem<T>>);
      });
    }

    // if current selected options are not equal to the controller's selected options, update the state.
    if (_selectedOptions != _controller!.value._selectedOptions) {
      setState(() {
        _selectedOptions.clear();
        _selectedOptions.addAll(_controller!.value._selectedOptions as Iterable<DropdownListItem<T>>);
      });
      widget.onOptionSelected?.call(_selectedOptions);
    }

    if (_selectionMode != _controller!.value._isDropdownOpen) {
      if (_controller!.value._isDropdownOpen) {
        _focusNode.requestFocus();
      } else {
        _focusNode.unfocus();
      }
    }
  }
}

/// MultiSelect Controller class.
/// This class is used to control the state of the MultiSelectDropdown widget.
/// This is just base class. The implementation of this class is in the MultiSelectController class.
/// The implementation of this class is hidden from the user.
class _MultiSelectController<T> {
  final List<DropdownListItem<T>> _disabledOptions = [];
  final List<DropdownListItem<T>> _options = [];
  final List<DropdownListItem<T>> _selectedOptions = [];
  bool _isDropdownOpen = false;
}

/// implementation of the MultiSelectController class.
class MultiSelectController<T>
    extends ValueNotifier<_MultiSelectController<T>> {
  MultiSelectController() : super(_MultiSelectController());

  bool _isDisposed = false;

  bool get isDisposed => _isDisposed;

  /// set the dispose method.
  @override
  void dispose() {
    super.dispose();
    _isDisposed = true;
  }

  /// Clear the selected options.
  /// [MultiSelectController] is used to clear the selected options.
  void clearAllSelection() {
    value._selectedOptions.clear();
    notifyListeners();
  }

  /// clear specific selected option
  /// [MultiSelectController] is used to clear specific selected option.
  void clearSelection(DropdownListItem<T> option) {
    if (!value._selectedOptions.contains(option)) return;

    if (value._disabledOptions.contains(option)) {
      throw Exception('Cannot clear selection of a disabled option');
    }

    if (!value._options.contains(option)) {
      throw Exception(
          'Cannot clear selection of an option that is not in the options list');
    }

    value._selectedOptions.remove(option);
    notifyListeners();
  }

  /// select the options
  /// [MultiSelectController] is used to select the options.
  void setSelectedOptions(List<DropdownListItem<T>> options) {
    if (options.any((element) => value._disabledOptions.contains(element))) {
      throw Exception('Cannot select disabled options');
    }

    if (options.any((element) => !value._options.contains(element))) {
      throw Exception('Cannot select options that are not in the options list');
    }

    value._selectedOptions.clear();
    value._selectedOptions.addAll(options);
    notifyListeners();
  }

  /// add selected option
  /// [MultiSelectController] is used to add selected option.
  void addSelectedOption(DropdownListItem<T> option) {
    if (value._disabledOptions.contains(option)) {
      throw Exception('Cannot select disabled option');
    }

    if (!value._options.contains(option)) {
      throw Exception('Cannot select option that is not in the options list');
    }

    value._selectedOptions.add(option);
    notifyListeners();
  }

  /// set disabled options
  /// [MultiSelectController] is used to set disabled options.
  void setDisabledOptions(List<DropdownListItem<T>> disabledOptions) {
    if (disabledOptions.any((element) => !value._options.contains(element))) {
      throw Exception(
          'Cannot disable options that are not in the options list');
    }

    value._disabledOptions.clear();
    value._disabledOptions.addAll(disabledOptions);
    notifyListeners();
  }

  /// setDisabledOption method
  /// [MultiSelectController] is used to set disabled option.
  void setDisabledOption(DropdownListItem<T> disabledOption) {
    if (!value._options.contains(disabledOption)) {
      throw Exception('Cannot disable option that is not in the options list');
    }

    value._disabledOptions.add(disabledOption);
    notifyListeners();
  }

  /// set options
  /// [MultiSelectController] is used to set options.
  void setOptions(List<DropdownListItem<T>> options) {
    value._options.clear();
    value._options.addAll(options);
    notifyListeners();
  }

  /// get disabled options
  List<DropdownListItem<T>> get disabledOptions => value._disabledOptions;

  /// get enabled options
  List<DropdownListItem<T>> get enabledOptions => value._options
      .where((element) => !value._disabledOptions.contains(element))
      .toList();

  /// get options
  List<DropdownListItem<T>> get options => value._options;

  /// get selected options
  List<DropdownListItem<T>> get selectedOptions => value._selectedOptions;

  /// get is dropdown open
  bool get isDropdownOpen => value._isDropdownOpen;

  /// show dropdown
  /// [MultiSelectController] is used to show dropdown.
  void showDropdown() {
    if (value._isDropdownOpen) return;
    value._isDropdownOpen = true;
    notifyListeners();
  }

  /// hide dropdown
  /// [MultiSelectController] is used to hide dropdown.
  void hideDropdown() {
    if (!value._isDropdownOpen) return;
    value._isDropdownOpen = false;
    notifyListeners();
  }


}

enum SelectionType {
single,
multi,
}

class DropdownListItem<T> extends StatelessWidget {
  final String label;
  final int value;

  const DropdownListItem({Key? key, required this.value, required this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DropdownListItem<int>(
      label: label,
      value: value,
    );
  }
}

/// Buid the selected item chip.
// Widget _buildChip(ValueItem<T> item, ChipConfig chipConfig) {
//   return SelectionChip<T>(
//     item: item,
//     chipConfig: chipConfig,
//     onItemDelete: (removedItem) {
//       if (_controller != null) {
//         _controller!.clearSelection(removedItem);
//       } else {
//         setState(() {
//           _selectedOptions.remove(removedItem);
//         });
//         widget.onOptionSelected?.call(_selectedOptions);
//       }
//       if (_focusNode.hasFocus) _focusNode.unfocus();
//     },
//   );
// }

/// Build the selected items for the dropdown.
// Widget _buildSelectedItems() {
//   // if (widget.chipConfig.wrapType == WrapType.scroll) {
//   //   return ListView.separated(
//   //     separatorBuilder: (context, index) =>
//   //         _getChipSeparator(widget.chipConfig),
//   //     scrollDirection: Axis.horizontal,
//   //     itemCount: _selectedOptions.length,
//   //     shrinkWrap: true,
//   //     itemBuilder: (context, index) {
//   //       final option = _selectedOptions[index];
//   //       if (widget.selectedItemBuilder != null) {
//   //         return widget.selectedItemBuilder!(context, option);
//   //       }
//   //       return _buildChip(option, widget.chipConfig);
//   //     },
//   //   );
//   // }
//   // return Wrap(
//   //     // spacing: widget.chipConfig.spacing,
//   //     // runSpacing: widget.chipConfig.runSpacing,
//   //     children: mapIndexed(_selectedOptions, (index, item) {
//   //       if (widget.selectedItemBuilder != null) {
//   //         return widget.selectedItemBuilder!(
//   //             context, _selectedOptions[index]);
//   //       }
//   //       return _buildChip(_selectedOptions[index], widget.chipConfig);
//   //     }).toList());
// }

/// Get the chip separator.
// Widget _getChipSeparator(ChipConfig chipConfig) {
//   if (chipConfig.separator != null) {
//     return chipConfig.separator!;
//   }
//
//   return SizedBox(
//     width: chipConfig.spacing,
//   );
// }

