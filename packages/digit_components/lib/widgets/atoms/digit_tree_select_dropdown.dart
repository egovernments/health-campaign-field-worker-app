library multiselect_dropdown;

import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox_icon.dart';
import 'package:digit_components/widgets/atoms/digit_multiselect_dropdown.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef OnOptionSelected<T> = void Function(List<TreeNode> selectedOptions);

class TreeSelectDropDown<int> extends StatefulWidget {
  // selection type of the dropdown
  final TreeselectionType treeselectionType;

  // Options
  final List<TreeNode> options;
  final List<TreeNode> selectedOptions;
  final OnOptionSelected<int>? onOptionSelected;

  // selected option
  final Icon? selectedOptionIcon;
  final Color? selectedOptionTextColor;
  final Color? selectedOptionBackgroundColor;
  final Widget Function(BuildContext, TreeNode)? selectedItemBuilder;

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
  final TreeSelectController<int>? controller;

  const TreeSelectDropDown({
    Key? key,
    required this.onOptionSelected,
    required this.options,
    this.selectedOptionTextColor,
    this.treeselectionType = TreeselectionType.MultiSelect,
    this.selectedOptions = const [],
    this.alwaysShowOptionIcon = false,
    this.optionTextStyle,
    this.chipConfig = const ChipConfig(),
    this.selectedOptionIcon = const Icon(Icons.check),
    this.selectedOptionBackgroundColor,
    this.optionsBackgroundColor,
    this.backgroundColor = Colors.white,
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
  State<TreeSelectDropDown<int>> createState() =>
      _TreeSelectDropDownState<int>();
}

class _TreeSelectDropDownState<T> extends State<TreeSelectDropDown<T>> {
  /// Options list that is used to display the options.
  final List<TreeNode> _options = [];

  /// Selected options list that is used to display the selected options.
  final List<TreeNode> _selectedOptions = [];

  /// The controller for the dropdown.
  OverlayState? _overlayState;
  OverlayEntry? _overlayEntry;
  bool _selectionMode = false;

  late final FocusNode _focusNode;
  final LayerLink _layerLink = LayerLink();

  /// value notifier that is used for controller.
  TreeSelectController<T>? _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initialize();
    });
    _focusNode = widget.focusNode ?? FocusNode();
    _controller = widget.controller ?? TreeSelectController<T>();
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
  void didUpdateWidget(covariant TreeSelectDropDown<T> oldWidget) {
    if (widget.controller == null && oldWidget.controller != null) {
      _controller = TreeSelectController<T>();
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
                            ? (widget.treeselectionType ==
                                    TreeselectionType.MultiSelect)
                                ? Text('${_selectedOptions.length} Selected')
                                : Text(_selectedOptions.first.key.toString())
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
        if (_anyItemSelected &&
            widget.treeselectionType == TreeselectionType.MultiSelect)
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
                side: BorderSide(
                  color: DigitColors().burningOrange,
                ),
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
  Widget _buildChip(TreeNode item, ChipConfig chipConfig) {
    return SelectionChip<T>(
      item: item,
      selectionType: widget.treeselectionType,
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
      List<TreeNode> options = widget.options;
      List<TreeNode> selectedOptions = [..._selectedOptions];

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
              ),
            ),
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
                clipBehavior: Clip.none,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    width: size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildFlatOptions(values,
                            options, selectedOptions, dropdownState),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }));
    });
  }

  Widget _buildFlatOptions(List<dynamic>values, List<TreeNode> options,
      List<TreeNode> selectedOptions, StateSetter dropdownState) {
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
          bool isSelected =
              selectedOptions.any((item) => item.value == option.value);
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

  Widget _buildOption(
    TreeNode option,
    bool isSelected,
    StateSetter dropdownState,
    Color backgroundColor,
    List<TreeNode> selectedOptions,
  ) {
    return TreeNodeWidget(
      currentOption: option,
      option: option,
      isSelected: isSelected,
      selectedOptions: selectedOptions,
      backgroundColor: backgroundColor,
      focusNode: _focusNode,
      treeselectionType: widget.treeselectionType,
      onOptionSelected: (updatedOptions) {
        if (widget.treeselectionType == TreeselectionType.MultiSelect) {
          dropdownState(() {
            selectedOptions.clear();
            selectedOptions.addAll(updatedOptions);
          });
          setState(() {
            _selectedOptions.clear();
            _selectedOptions.addAll(updatedOptions);
          });
        } else {
          dropdownState(() {
            selectedOptions.clear();
            selectedOptions.addAll(updatedOptions);
          });
          setState(() {
            _selectedOptions.clear();
            _selectedOptions.addAll(updatedOptions);
          });
        }

        if (_controller != null) {
          _controller!.value._selectedOptions.clear();
          _controller!.value._selectedOptions.addAll(_selectedOptions);
        }

        widget.onOptionSelected?.call(selectedOptions);
      },
    );
  }

  /// Clear the selected options.
  /// [TreeSelectController] is used to clear the selected options.
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

/// TreeSelect Controller class.
/// This class is used to control the state of the MultiSelectDropdown widget.
/// This is just base class. The implementation of this class is in the TreeSelectController class.
/// The implementation of this class is hidden from the user.
class _TreeSelectController<T> {
  final List<TreeNode> _options = [];
  final List<TreeNode> _selectedOptions = [];
  bool _isDropdownOpen = false;
}

/// implementation of the treeSelectController class.
class TreeSelectController<T> extends ValueNotifier<_TreeSelectController<T>> {
  TreeSelectController() : super(_TreeSelectController());

  bool _isDisposed = false;

  bool get isDisposed => _isDisposed;

  /// set the dispose method.
  @override
  void dispose() {
    super.dispose();
    _isDisposed = true;
  }

  /// Clear the selected options.
  /// [TreeSelectController] is used to clear the selected options.
  void clearAllSelection() {
    value._selectedOptions.clear();
    notifyListeners();
  }

  /// clear specific selected option
  /// [TreeSelectController] is used to clear specific selected option.
  void clearSelection(TreeNode option) {
    if (!value._selectedOptions
        .any((item) => item.key == option.key && item.value == option.value)) {
      return;
    }
    value._selectedOptions.removeWhere(
        (item) => item.key == option.key && item.value == option.value);
    notifyListeners();
  }

  /// select the options
  /// [TreeSelectController] is used to select the options.
  void setSelectedOptions(List<TreeNode> options) {
    if (options.any((element) => !value._options.contains(element))) {
      throw Exception('Cannot select options that are not in the options list');
    }

    value._selectedOptions.clear();
    value._selectedOptions.addAll(options);
    notifyListeners();
  }

  /// add selected option
  /// [TreeSelectController] is used to add selected option.
  void addSelectedOption(TreeNode option) {
    if (!value._options.contains(option)) {
      throw Exception('Cannot select option that is not in the options list');
    }

    value._selectedOptions.add(option);
    notifyListeners();
  }

  /// set options
  /// [TreeSelectController] is used to set options.
  void setOptions(List<TreeNode> options) {
    value._options.clear();
    value._options.addAll(options);
    notifyListeners();
  }

  /// get options
  List<TreeNode> get options => value._options;

  /// get selected options
  List<TreeNode> get selectedOptions => value._selectedOptions;

  /// get is dropdown open
  bool get isDropdownOpen => value._isDropdownOpen;

  /// show dropdown
  /// [TreeSelectController] is used to show dropdown.
  void showDropdown() {
    if (value._isDropdownOpen) return;
    value._isDropdownOpen = true;
    notifyListeners();
  }

  /// hide dropdown
  /// [TreeSelectController] is used to hide dropdown.
  void hideDropdown() {
    if (!value._isDropdownOpen) return;
    value._isDropdownOpen = false;
    notifyListeners();
  }
}

enum TreeselectionType {
  singleSelect,
  MultiSelect,
}

class TreeNode {
  final String key;
  final String value;
  final List<TreeNode> children;

  TreeNode(this.key, this.value, this.children);
}

class TreeNodeWidget extends StatefulWidget {
  final TreeNode option;
  final TreeNode currentOption;
  final bool isSelected;
  final List<TreeNode> selectedOptions;
  final Color backgroundColor;
  final ValueChanged<List<TreeNode>> onOptionSelected;
  final FocusNode focusNode;
  final TreeselectionType treeselectionType;

  const TreeNodeWidget({
    Key? key,
    required this.option,
    required this.currentOption,
    required this.isSelected,
    required this.selectedOptions,
    required this.onOptionSelected,
    required this.backgroundColor,
    required this.focusNode,
    required this.treeselectionType,
  }) : super(key: key);

  @override
  _TreeNodeWidgetState createState() => _TreeNodeWidgetState();
}

class _TreeNodeWidgetState extends State<TreeNodeWidget> {
  bool _isExpanded = false;
  bool _isSelected = false;

// Update _areAllChildrenSelected method in _TreeNodeWidgetState
  bool _areAllChildrenSelected(TreeNode node) {
    if (node.children.isEmpty) {
      return widget.selectedOptions.any((item) => item.key == node.key);
    }

    return node.children.every((child) => _areAllChildrenSelected(child));
  }

// Update _isAnyChildSelected method in _TreeNodeWidgetState
  bool _isAnyChildSelected(TreeNode node) {
    return node.children.any((child) =>
        widget.selectedOptions.any((item) => item.key == child.key) ||
        _isAnyChildSelected(child));
  }

// Update _selectAllChildren method in _TreeNodeWidgetState
  void _selectAllChildren(TreeNode node) {
    if (node.children.isEmpty) {
      if (!widget.selectedOptions.any((item) => item.key == node.key)) {
        widget.onOptionSelected([...widget.selectedOptions, node]);
      }
    } else {
      for (final child in node.children) {
        _selectAllChildren(child);
      }
    }
  }

// Update _deselectAllChildren method in _TreeNodeWidgetState
  void _deselectAllChildren(TreeNode node) {
    if (node.children.isEmpty) {
      widget.onOptionSelected([...widget.selectedOptions]
        ..removeWhere((item) => item.key == node.key));
    } else {
      for (final child in node.children) {
        _deselectAllChildren(child);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedColor: Colors.transparent,
      selected: widget.isSelected,
      autofocus: false,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      tileColor: widget.backgroundColor,
      textColor: const DigitColors().davyGray,
      selectedTileColor:
          widget.treeselectionType == TreeselectionType.singleSelect
              ? const DigitColors().burningOrange
              : const DigitColors().white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      title: Column(
        children: [
          Row(
            children: [
              Transform.rotate(
                angle: _isExpanded ? 0 : -1.5,
                child: Icon(
                  Icons.arrow_drop_down,
                  size: 24,
                  color: const DigitColors().woodsmokeBlack,
                ),
              ),
              if (widget.treeselectionType == TreeselectionType.MultiSelect)
                InkWell(
                  onTap: () {
                    _isSelected = _areAllChildrenSelected(widget.currentOption);
                    if (_isSelected) {
                      _deselectAllChildren(widget.currentOption);
                    } else {
                      _selectAllChildren(widget.currentOption);
                    }
                    setState(() {
                      _isSelected =
                          _areAllChildrenSelected(widget.currentOption);
                    });
                  },
                  child: _areAllChildrenSelected(widget.currentOption)
                      ? DigitCheckboxIcon(
                          state: CheckboxState.checked,
                        )
                      : _isAnyChildSelected(widget.currentOption)
                          ? DigitCheckboxIcon(state: CheckboxState.intermediate)
                          : DigitCheckboxIcon(state: CheckboxState.unchecked),
                ),
              const SizedBox(
                width: 4,
              ),
              Text(
                widget.currentOption.value,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: const DigitColors().davyGray,
                ),
              ),
            ],
          ),
          if (_isExpanded && widget.currentOption.children.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: const DigitColors().quillGray,
                      width: 2.0, // specify the width of the border
                    ),
                    top: BorderSide.none,
                    bottom: BorderSide.none,
                    right: BorderSide.none,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    children: widget.currentOption.children.map((child) {
                      bool isChildSelected =
                          _areAllChildrenSelected(widget.currentOption);
                      return TreeNodeWidget(
                        option: widget.option,
                        isSelected: isChildSelected,
                        focusNode: widget.focusNode,
                        selectedOptions: widget.selectedOptions,
                        onOptionSelected: widget.onOptionSelected,
                        backgroundColor: widget.backgroundColor,
                        treeselectionType: widget.treeselectionType,
                        currentOption: child,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
        ],
      ),
      onTap: () {
        if (widget.currentOption.children.isNotEmpty) {
          setState(() {
            _isExpanded = !_isExpanded;
          });
        } else if (widget.selectedOptions
            .any((item) => item.key == widget.currentOption.key)) {
          widget.onOptionSelected([...widget.selectedOptions]
            ..removeWhere((item) => item.key == widget.currentOption.key));
        } else {
          if (widget.treeselectionType == TreeselectionType.MultiSelect) {
            if (!widget.selectedOptions
                .any((item) => item.key == widget.currentOption.key)) {
              widget.onOptionSelected(
                  [...widget.selectedOptions, widget.currentOption]);
            }
          } else {
            setState(() {
              widget.selectedOptions.clear();
            });
            widget.onOptionSelected(
                [...widget.selectedOptions, widget.currentOption]);
            widget.focusNode.unfocus();
          }
        }
      },
    );
  }
}

class SelectionChip<T> extends StatelessWidget {
  final TreeselectionType selectionType;
  final ChipConfig chipConfig;
  final Function(TreeNode) onItemDelete;
  final TreeNode item;

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
      label: Text(item.key),
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
      onDeleted: () {
        // Ensure the item is removed before calling onItemDelete
        onItemDelete(item);
      },
    );
  }
}
