library multiselect_dropdown;

import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'digit_checkbox_icon.dart';

typedef OnOptionSelected<T> = void Function(
    List<DropdownListItem<T>> selectedOptions);

class MultiSelectDropDown<int> extends StatefulWidget {
  // selection type of the dropdown
  final SelectionType selectionType;
  final ChipPosition chipPosition;

  // Options
  final List<DropdownListItem<int>> options;
  final List<DropdownListItem<int>> selectedOptions;
  final OnOptionSelected<int>? onOptionSelected;

  // selected option
  final Icon? selectedOptionIcon;
  final Color? selectedOptionTextColor;
  final Color? selectedOptionBackgroundColor;
  final Widget Function(BuildContext, DropdownListItem<int>)?
      selectedItemBuilder;

  // chip configuration
  final bool showChipInSingleSelectMode;
  final ChipConfig chipConfig;

  // options configuration
  final Color? optionsBackgroundColor;
  final TextStyle? optionTextStyle;
  final Widget? optionSeparator;
  final bool alwaysShowOptionIcon;

  // dropdownfield configuration
  final Color? backgroundColor;
  final Icon? suffixIcon;
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
  
  const MultiSelectDropDown({
    Key? key,
    required this.onOptionSelected,
    required this.options,
    this.selectedOptionTextColor,
    this.chipConfig = const ChipConfig(),
    this.chipPosition = ChipPosition.outside,
    this.selectionType = SelectionType.multiSelect,
    this.selectedOptions = const [],
    this.alwaysShowOptionIcon = false,
    this.optionTextStyle,
    this.selectedOptionIcon = const Icon(Icons.check),
    this.selectedOptionBackgroundColor,
    this.optionsBackgroundColor,
    this.backgroundColor = Colors.white,
    this.showChipInSingleSelectMode = false,
    this.suffixIcon = const Icon(Icons.arrow_drop_down),
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
  }) : super(key: key);

  @override
  State<MultiSelectDropDown<int>> createState() =>
      _MultiSelectDropDownState<int>();
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialize();
    });
    _focusNode = widget.focusNode ?? FocusNode();
    _controller = widget.controller ?? MultiSelectController<T>();
  }

  void _initialize() {
    if (!mounted) return;
    _addOptions();
    _overlayState ??= Overlay.of(context);
    _focusNode.addListener(_handleFocusChange);
  }

  /// Adds the selected options and disabled options to the options list.
  void _addOptions() {
    setState(() {
      _selectedOptions.addAll(_controller?.selectedOptions.isNotEmpty == true
          ? _controller!.selectedOptions
          : widget.selectedOptions);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_controller != null && _controller?._isDisposed == false) {
        _controller!.setOptions(_options);
        _controller!.setSelectedOptions(_selectedOptions);
        _controller!.addListener(_handleControllerChange);
      }
    });
  }

  /// Handles the focus change to show/hide the dropdown.
  _handleFocusChange() {
    if (_focusNode.hasFocus && mounted) {
      _overlayEntry = _buildOverlayEntry();
      Overlay.of(context).insert(_overlayEntry!);
      // return;
    }

    if (_focusNode.hasFocus == false && _overlayEntry != null) {
      _overlayEntry?.remove();
    }

    if (mounted) {
      setState(() {
        _selectionMode = _focusNode.hasFocus == true;
      });
    }

    if (_controller != null) {
      _controller!.value._isDropdownOpen = _focusNode.hasFocus == true;
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

    super.didUpdateWidget(oldWidget);
  }

  /// Calculate offset size for dropdown.
  List _calculateOffsetSize() {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;

    var size = renderBox?.size ?? Size.zero;
    var offset = renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;

    final availableHeight = MediaQuery.of(context).size.height - offset.dy;

    return [size, availableHeight];
  }

  @override
  Widget build(BuildContext context) {
    double dropdownWidth = MediaQuery.of(context).size.width < 600 ? 340 : 600;
    return Column(
      children: [
        CompositedTransformTarget(
          link: _layerLink,
          child: Focus(
            canRequestFocus: true,
            skipTraversal: true,
            focusNode: _focusNode,
            child: InkWell(
              splashColor: Colors.transparent,
              // Set splashColor to transparent
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
              onTap: _toggleFocus,
              child: StatefulBuilder(builder: (context, setState) {
                return Container(
                  height: 40,
                  width: dropdownWidth,
                  constraints: const BoxConstraints(
                    minWidth: 340,
                    minHeight: 40,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                  decoration: _getContainerDecoration(),
                  child: Row(
                    children: [
                      Expanded(
                        child: (_selectedOptions.isNotEmpty)
                            ? Text('${_selectedOptions.length} Selected')
                            : const Text(''),
                      ),
                      AnimatedRotation(
                        turns: _selectionMode ? 0.5 : 0,
                        duration: const Duration(milliseconds: 200),
                        child: widget.suffixIcon,
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        if (_anyItemSelected)
          SizedBox(
            // height: 40,
            width: dropdownWidth,
            child: _getContainerContent(),
          )
      ],
    );
  }

  /// Container Content for the dropdown.
  Widget _getContainerContent() {
    if (_selectedOptions.isEmpty) {
      return const Text('select items to show here');
    }

    return _buildSelectedItems();
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
              color: const DigitColors().burningOrange ??
                  const DigitColors().burningOrange,
              width: 1,
            )
          : Border.all(
              color: const DigitColors().davyGray,
              width: 1,
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
    _focusNode.dispose();
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

    return OverlayEntry(builder: (context) {
      List<DropdownListItem<T>> options = widget.options;
      List<DropdownListItem<T>> selectedOptions = [..._selectedOptions];

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
              targetAnchor: Alignment.bottomLeft,
              followerAnchor: Alignment.topLeft,
              offset: Offset.zero,
              child: Material(
                  borderRadius: BorderRadius.zero,
                  // elevation: 4,
                  shadowColor: null,
                  child: Container(
                    // constraints: BoxConstraints.loose(Size(size.width, 250)),
                    width: size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        widget.selectionType == SelectionType.nestedMultiSelect
                            ? _buildNestedOptions(values, options, selectedOptions, dropdownState)
                            : _buildFlatOptions(values, options, selectedOptions, dropdownState),
                      ],
                    ),
                  )),
            ),
          ],
        );
      }));
    });
  }

  Widget _buildFlatOptions(
  List<dynamic>values,
      List<DropdownListItem<T>> options,
      List<DropdownListItem<T>> selectedOptions,
      StateSetter dropdownState) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: values[1]-30,
      ),
      child: ListView.separated(
        separatorBuilder: (_, __) =>
        widget.optionSeparator ?? const SizedBox(height: 0),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: options.length,
        itemBuilder: (context, index) {
          final option = options[index];
          bool isSelected = selectedOptions.any((item) =>
          item.value == option.value &&
              item.label == option.label);
          Color backgroundColor = index % 2 == 0
              ? const DigitColors().white
              : const DigitColors().alabasterWhite;
          return _buildOption(
            option,
            isSelected,
            dropdownState,
            backgroundColor,
            selectedOptions,
          );
        },
      ),
    );
  }

  Widget _buildNestedOptions(
      List<dynamic>values,
      List<DropdownListItem<T>> options,
      List<DropdownListItem<T>> selectedOptions,
      StateSetter dropdownState) {
    // Group options by type
    final groupedOptions = groupBy(options, (option) => option.type);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: values[1]-30,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: groupedOptions.length,
        itemBuilder: (context, index) {
          final type = groupedOptions.keys.elementAt(index);
          final typeOptions = groupedOptions[type] ?? [];

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (type != null) Container(
                padding: const EdgeInsets.all(10),
                color: const DigitColors().alabasterWhite,
                child: Text(
                  type,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: 'Roboto',
                    color: const DigitColors().davyGray,
                  ),
                ),
              ),
              ...typeOptions.map((option) {
                bool isSelected = selectedOptions.any((item) =>
                item.value == option.value &&
                    item.label == option.label);
                Color backgroundColor = options.indexOf(option) % 2 == 0
                    ? const DigitColors().white
                    : const DigitColors().alabasterWhite;

                return _buildOption(
                  option,
                  isSelected,
                  dropdownState,
                  backgroundColor,
                  selectedOptions,
                );
              }).toList(),
            ],
          );
        },
      ),
    );
  }

  Column _buildOption(
      DropdownListItem<T> option,
      bool isSelected,
      StateSetter dropdownState,
      Color backgroundColor,
      List<DropdownListItem<T>> selectedOptions) {
    return Column(
      children: [
        ListTile(
          title: Row(
            children: [
              if (isSelected)
                DigitCheckboxIcon(
                  state: CheckboxState.checked,
                  color: const DigitColors().white,
                ),
              if (!isSelected) DigitCheckboxIcon(state: CheckboxState.unchecked),
              const SizedBox(
                width: 10,
              ),
              Text(
                option.label,
                style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
            ],
          ),
          textColor: const DigitColors().davyGray,
          selectedColor: const DigitColors().white,
          selected: isSelected,
          autofocus: true,
          tileColor: widget.selectionType==SelectionType.nestedMultiSelect  ? const DigitColors().white :backgroundColor,
          selectedTileColor: const DigitColors().burningOrange,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          onTap: () {
            if (isSelected) {
              dropdownState(() {
                selectedOptions.remove(option);
              });
              setState(() {
                _selectedOptions.remove(option);
              });
              bool isSelected1 = selectedOptions.any((item) =>
              item.value == option.value &&
                  item.label == option.label);
              print(isSelected1);
            } else {
              dropdownState(() {
                selectedOptions.add(option);
              });
              setState(() {
                _selectedOptions.add(option);
              });
            }

            if (_controller != null) {
              _controller!.value._selectedOptions.clear();
              _controller!.value._selectedOptions.addAll(_selectedOptions);
            }
            widget.onOptionSelected?.call(_selectedOptions);
          },
        ),
        Container(height: 2,
          color: const DigitColors().quillGray,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(left: 10, right: 10,),
        )
      ],
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

  /// Build the selected items for the dropdown.
  Widget _buildSelectedItems() {
    return Wrap(
      spacing: widget.chipConfig.spacing,
      runSpacing: widget.chipConfig.runSpacing,
      children: [
        ..._selectedOptions.asMap().entries.map((entry) {
          final index = entry.key;
          final item = entry.value;

          Widget chip = widget.selectedItemBuilder != null
              ? widget.selectedItemBuilder!(context, item)
              : _buildChip(item, widget.chipConfig);

          return chip;
        }),
        if (_selectedOptions
            .isNotEmpty) // Display "Clear All" only if there are selected options
          InkWell(
            onTap: () => clear(),
            child: Chip(
              backgroundColor: DigitColors().white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: DigitColors().burningOrange, ),
                borderRadius: BorderRadius.circular(50),
              ),
              padding: EdgeInsets.only(left: 8, top: 0, right: 8, bottom: 0),
              labelPadding: EdgeInsets.only(top: 2, bottom: 2),
              label: Text('Clear All',
                  style: TextStyle(color: const DigitColors().burningOrange)),
            ),

          ),
      ],
    );
  }

  /// Buid the selected item chip.
  Widget _buildChip(DropdownListItem<T> item, ChipConfig chipConfig) {
    return SelectionChip<T>(
      item: item,
      selectionType: widget.selectionType,
      chipConfig: chipConfig,
      onItemDelete: (removedItem) {
        if (_controller != null) {
          _controller!.clearSelection(removedItem);
        } else {
          setState(() {
            _selectedOptions.remove(removedItem);
          });
          widget.onOptionSelected?.call(_selectedOptions);
        }
        if (_focusNode.hasFocus) _focusNode.unfocus();
      },
    );
  }

  /// handle the controller change.
  void _handleControllerChange() {
    // if the controller is null, return.
    if (_controller == null || _controller?.isDisposed == true) return;

    // if current options are not equal to the controller's options, update the state.
    if (_options != _controller!.value._options) {
      setState(() {
        _options.clear();
        _options.addAll(_controller!.value._options);
      });
    }

    // if current selected options are not equal to the controller's selected options, update the state.
    if (_selectedOptions != _controller!.value._selectedOptions) {
      setState(() {
        _selectedOptions.clear();
        _selectedOptions.addAll(_controller!.value._selectedOptions);
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
  multiSelect,
  nestedMultiSelect,
}

enum ChipPosition {
  inside,
  outside,
}

class DropdownListItem<T> extends StatelessWidget {
  final String label;
  final int value;
  final String? type;

  const DropdownListItem({Key? key, required this.value, required this.label, this.type})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownListItem<int>(
      label: label,
      value: value,
      type: type,
    );
  }
}

class ChipConfig {
  final Icon? deleteIcon;

  final Color deleteIconColor;
  final Color labelColor;
  final Color? backgroundColor;

  final TextStyle? labelStyle;
  final EdgeInsets padding;
  final EdgeInsets labelPadding;

  final double radius;
  final double spacing;
  final double runSpacing;

  final Widget? separator;

  final bool autoScroll;

  const ChipConfig({
    this.deleteIcon,
    this.deleteIconColor = Colors.white,
    this.backgroundColor,
    this.padding = const EdgeInsets.only(left: 12, top: 0, right: 4, bottom: 0),
    this.radius = 50,
    this.spacing = 8,
    this.runSpacing = 8,
    this.separator,
    this.labelColor = Colors.white,
    this.labelStyle,
    this.labelPadding = EdgeInsets.zero,
    this.autoScroll = false,
  });
}

class SelectionChip<T> extends StatelessWidget {
  final SelectionType selectionType;
  final ChipConfig chipConfig;
  final Function(DropdownListItem<T>) onItemDelete;
  final DropdownListItem<T> item;

  const SelectionChip({
    Key? key,
    required this.chipConfig,
    required this.item,
    required this.onItemDelete,
    required this.selectionType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

      return Chip(
        padding: chipConfig.padding,
        label: selectionType==SelectionType.nestedMultiSelect ? Text('${item.type}: ${item.label}') : Text(item.label) ,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        deleteIcon: Icon(
          Icons.cancel,
          color: const DigitColors().davyGray,
        ),
        deleteIconColor: chipConfig.deleteIconColor,
        labelPadding: const EdgeInsets.only(top: 4, bottom: 4),
        backgroundColor: const DigitColors().quillGray,
        labelStyle: chipConfig.labelStyle ??
            TextStyle(
              color: const DigitColors().woodsmokeBlack,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
        onDeleted: () => onItemDelete(item),
      );
  }
}
