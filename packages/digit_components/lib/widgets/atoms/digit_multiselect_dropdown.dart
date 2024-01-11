library multiselect_dropdown;

import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../constants/AppView.dart';
import '../../constants/app_constants.dart';
import '../../enum/app_enums.dart';
import '../../models/DropdownModels.dart';
import '../../models/chipModel.dart';
import '../helper_widget/selection_chip.dart';
import 'digit_checkbox_icon.dart';


///the MultiSelectDropDown component is used to create a multi-select dropdown with a list of options.
///The onOptionSelected callback is used to handle the selected items,
/// and the appearance of the dropdown, chips,
/// and other elements can be customized using various properties.
///
/// Example usage:
/// ```dart
/// MultiSelectDropDown(
///             // Provide the list of options
///             options: options,
///             // Provide the initially selected options
///             selectedOptions: selectedOptions,
///             // Define the callback function when options are selected/deselected
///             onOptionSelected: (List<DropdownItem> selectedItems) {
///               // Handle the selected items
///               setState(() {
///                 selectedOptions = selectedItems;
///               });
///             },
///             // Customize the appearance of chips
///             chipConfig: ChipConfig(
///               labelStyle: TextStyle(color: Colors.white),
///               backgroundColor: Colors.blue,
///               deleteIconColor: Colors.white,
///             ),
///             // Customize the suffix icon (dropdown arrow)
///             suffixIcon: Icon(Icons.arrow_drop_down),
///             // Customize the selection type (multiSelect or singleSelect)
///             selectionType: SelectionType.multiSelect,
///           ),
///

typedef OnOptionSelected<T> = void Function(
    List<DropdownItem> selectedOptions);

class MultiSelectDropDown<int> extends StatefulWidget {
  /// selection type of the dropdown
  final SelectionType selectionType;

  /// Options
  final List<DropdownItem> options;
  final List<DropdownItem> selectedOptions;
  final OnOptionSelected<int>? onOptionSelected;

  /// chip configuration
  final ChipConfig chipConfig;

  /// dropdownfield configuration
  final Icon? suffixIcon;

  /// focus node
  final FocusNode? focusNode;

  /// Controller for the dropdown
  /// [controller] is the controller for the dropdown. It can be used to programmatically open and close the dropdown.
  final MultiSelectController<int>? controller;

  const MultiSelectDropDown({
    Key? key,
    required this.onOptionSelected,
    required this.options,
    this.chipConfig = const ChipConfig(),
    this.selectionType = SelectionType.multiSelect,
    this.selectedOptions = const [],
    this.suffixIcon = const Icon(Icons.arrow_drop_down),
    this.focusNode,
    this.controller,
  }) : super(key: key);

  @override
  State<MultiSelectDropDown<int>> createState() =>
      _MultiSelectDropDownState<int>();
}

class _MultiSelectDropDownState<T> extends State<MultiSelectDropDown<T>> {
  /// Options list that is used to display the options.
  final List<DropdownItem> _options = [];

  /// Selected options list that is used to display the selected options.
  final List<DropdownItem> _selectedOptions = [];

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

    /// If the options are changed externally, then the options are updated.
    if (listEquals(widget.options, oldWidget.options) == false) {
      _options.clear();
      _options.addAll(widget.options);

      /// If the controller is not null, then the options are updated in the controller.
      if (_controller != null) {
        _controller!.setOptions(_options);
      }
    }

    /// If the selected options are changed externally, then the selected options are updated.
    if (listEquals(widget.selectedOptions, oldWidget.selectedOptions) ==
        false) {
      _selectedOptions.clear();
      _selectedOptions.addAll(widget.options
          .where((element) => widget.selectedOptions.contains(element)));

      /// If the controller is not null, then the selected options are updated in the controller.
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
    double dropdownWidth = AppView.isMobileView(MediaQuery.of(context).size.width)
        ? Default.mobileInputWidth
        : Default.desktopInputWidth;
    return Column(
      children: [
        CompositedTransformTarget(
          link: _layerLink,
          child: Focus(
            canRequestFocus: true,
            skipTraversal: true,
            focusNode: _focusNode,
            child: InkWell(
              splashColor: const DigitColors().transaparent,
              highlightColor: const DigitColors().transaparent,
              hoverColor: const DigitColors().transaparent,
              onTap: _toggleFocus,
              child: StatefulBuilder(builder: (context, setState) {
                return Container(
                  height: Default.height,
                  width: dropdownWidth,
                  constraints: const BoxConstraints(
                    minWidth: Default.mobileInputWidth,
                    minHeight: Default.height,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: kPadding,),
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
                        duration: DropdownConstants.animationDuration,
                        child: widget.suffixIcon,
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
        const Gap(
          kPadding,
        ),
        if (_anyItemSelected)
          SizedBox(
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
              color: const DigitColors().burningOrange,
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
    /// Calculate the offset and the size of the dropdown button
    final values = _calculateOffsetSize();
    /// Get the size from the first item in the values list
    final size = values[0] as Size;

    return OverlayEntry(builder: (context) {
      List<DropdownItem> options = widget.options;
      List<DropdownItem> selectedOptions = [..._selectedOptions];

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
                shadowColor: null,
                child: SizedBox(
                  width: size.width,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      widget.selectionType == SelectionType.nestedMultiSelect
                          ? _buildNestedOptions(
                              values, options, selectedOptions, dropdownState)
                          : _buildFlatOptions(
                              values, options, selectedOptions, dropdownState),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }));
    });
  }

  Widget _buildFlatOptions(
      List<dynamic> values,
      List<DropdownItem> options,
      List<DropdownItem> selectedOptions,
      StateSetter dropdownState) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: values[1] - 30,
      ),
      child: ListView.separated(
        separatorBuilder: (_, __) =>
            const SizedBox(height: 0),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: options.length,
        itemBuilder: (context, index) {
          final option = options[index];
          bool isSelected = selectedOptions.any(
              (item) => item.code == option.code && item.name == option.name);
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
      List<dynamic> values,
      List<DropdownItem> options,
      List<DropdownItem> selectedOptions,
      StateSetter dropdownState) {
    /// Group options by type
    final groupedOptions = groupBy(options, (option) => option.type);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: values[1] - 30,
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
              if (type != null)
                Container(
                  padding: const EdgeInsets.all(10),
                  color: const DigitColors().alabasterWhite,
                  child: Text(
                    type,
                    style: DigitTheme.instance.mobileTheme.textTheme.headlineSmall?.copyWith(
                      color: const DigitColors().davyGray,
                    ),
                  ),
                ),
              ...typeOptions.map((option) {
                bool isSelected = selectedOptions.any((item) =>
                    item.code == option.code && item.name == option.name);
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
      DropdownItem option,
      bool isSelected,
      StateSetter dropdownState,
      Color backgroundColor,
      List<DropdownItem> selectedOptions) {
    return Column(
      children: [
        ListTile(
          splashColor: const DigitColors().transaparent,
          focusColor: const DigitColors().transaparent,
          hoverColor: const DigitColors().transaparent,
          title: Row(
            children: [
              if (isSelected)
                DigitCheckboxIcon(
                  state: CheckboxState.checked,
                  color: const DigitColors().white,
                ),
              if (!isSelected)
                const DigitCheckboxIcon(state: CheckboxState.unchecked),
              const Gap(
                10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      if (option.textIcon != null)
                        Icon(
                          option.textIcon,
                          size: DropdownConstants.textIconSize,
                          color: isSelected
                              ? const DigitColors().white
                              : const DigitColors().davyGray,
                        ),
                      if (option.textIcon != null)
                        const Gap(
                          kPadding / 2,
                        ),
                      Text(
                        option.name,
                        style: DigitTheme
                            .instance.mobileTheme.textTheme.headlineSmall?.copyWith(
                          color: isSelected
                              ? const DigitColors().white
                              : const DigitColors().davyGray,
                        ),
                      ),
                    ],
                  ),
                  if (option.description != null)
                    Text(
                      option.description!,
                      style: DigitTheme.instance.mobileTheme.textTheme.bodySmall
                          ?.copyWith(
                        color: isSelected
                            ? const DigitColors().white
                            : const DigitColors().davyGray,
                      ),
                    ),
                ],
              ),
            ],
          ),
          textColor: const DigitColors().davyGray,
          selectedColor: const DigitColors().white,
          selected: isSelected,
          autofocus: true,
          tileColor: widget.selectionType == SelectionType.nestedMultiSelect
              ? const DigitColors().white
              : backgroundColor,
          selectedTileColor: const DigitColors().burningOrange,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10),
          onTap: () {
            if (isSelected) {
              dropdownState(() {
                selectedOptions.remove(option);
              });
              setState(() {
                _selectedOptions.remove(option);
              });
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
        Container(
          height: 2,
          color: const DigitColors().quillGray,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
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

          Widget chip = _buildChip(item, widget.chipConfig);

          return chip;
        }),
        if (_selectedOptions
            .isNotEmpty) /// Display "Clear All" only if there are selected options
          InkWell(
            onTap: () => clear(),
            child: Chip(
              backgroundColor: const DigitColors().white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: const DigitColors().burningOrange,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: kPadding),
              labelPadding: const EdgeInsets.only(top: 2, bottom: 2),
              label: Text('Clear All',
                  style: TextStyle(color: const DigitColors().burningOrange)),
            ),
          ),
      ],
    );
  }

  /// Build the selected item chip.
  Widget _buildChip(DropdownItem item, ChipConfig chipConfig) {
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
    /// if the controller is null, return.
    if (_controller == null || _controller?.isDisposed == true) return;

    /// if current options are not equal to the controller's options, update the state.
    if (_options != _controller!.value._options) {
      setState(() {
        _options.clear();
        _options.addAll(_controller!.value._options);
      });
    }

    /// if current selected options are not equal to the controller's selected options, update the state.
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

  final List<DropdownItem> _options = [];
  final List<DropdownItem> _selectedOptions = [];
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
  void clearSelection(DropdownItem option) {
    if (!value._selectedOptions.contains(option)) return;
    value._selectedOptions.remove(option);
    notifyListeners();
  }

  /// select the options
  /// [MultiSelectController] is used to select the options.
  void setSelectedOptions(List<DropdownItem> options) {
    if (options.any((element) => !value._options.contains(element))) {
      throw Exception('Cannot select options that are not in the options list');
    }

    value._selectedOptions.clear();
    value._selectedOptions.addAll(options);
    notifyListeners();
  }

  /// add selected option
  /// [MultiSelectController] is used to add selected option.
  void addSelectedOption(DropdownItem option) {

    if (!value._options.contains(option)) {
      throw Exception('Cannot select option that is not in the options list');
    }

    value._selectedOptions.add(option);
    notifyListeners();
  }

  /// set options
  /// [MultiSelectController] is used to set options.
  void setOptions(List<DropdownItem> options) {
    value._options.clear();
    value._options.addAll(options);
    notifyListeners();
  }

  /// get options
  List<DropdownItem> get options => value._options;

  /// get selected options
  List<DropdownItem> get selectedOptions => value._selectedOptions;

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
