library multiselect_dropdown;

import 'package:collection/collection.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/models/digit_row_card/digit_row_card_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'digit_checkbox_icon.dart';

typedef OnOptionSelected<T> = void Function(
    List<TreeNode> selectedOptions);

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
  final Widget Function(BuildContext, TreeNode)?
  selectedItemBuilder;



  // options configuration
  final Color? optionsBackgroundColor;
  final TextStyle? optionTextStyle;
  final double dropdownHeight;
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

  const TreeSelectDropDown({
    Key? key,
    required this.onOptionSelected,
    required this.options,
    this.selectedOptionTextColor,
    this.treeselectionType = TreeselectionType.MultiSelect,
    this.selectedOptions = const [],
    this.alwaysShowOptionIcon = false,
    this.optionTextStyle,
    this.selectedOptionIcon = const Icon(Icons.check),
    this.selectedOptionBackgroundColor,
    this.optionsBackgroundColor,
    this.backgroundColor = Colors.white,
    this.dropdownHeight = 200,
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
  void didUpdateWidget(covariant TreeSelectDropDown<T> oldWidget) {
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

    return [size, availableHeight < widget.dropdownHeight];
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
    return const Text('need to complete');
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
                    constraints: BoxConstraints.loose(Size(size.width, 250)),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child : _buildFlatOptions(options, selectedOptions, dropdownState),
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

  Widget _buildFlatOptions(
      List<TreeNode> options,
      List<TreeNode> selectedOptions,
      StateSetter dropdownState) {
    return ListView.separated(
      separatorBuilder: (_, __) =>
      widget.optionSeparator ?? const SizedBox(height: 0),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: options.length,
      itemBuilder: (context, index) {
        final option = options[index];
        bool isSelected = selectedOptions.any((item) =>
        item.value == option.value);
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
    );
  }

  // Modify _buildOption to use TreeNodeWidget
  Widget _buildOption(
      TreeNode option,
      bool isSelected,
      StateSetter dropdownState,
      Color backgroundColor,
      List<TreeNode> selectedOptions,
      ) {
    return TreeNodeWidget(
      option: option,
      isSelected: isSelected,
      selectedOptions: selectedOptions,
      backgroundColor: backgroundColor,
      onOptionSelected: (updatedOptions) {
        dropdownState(() {
          selectedOptions.clear();
          selectedOptions.addAll(updatedOptions);
        });
        widget.onOptionSelected?.call(selectedOptions);
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
  final List<TreeNode> _options = [];
  final List<TreeNode> _selectedOptions = [];
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
  void clearSelection(TreeNode option) {
    if (!value._selectedOptions.contains(option)) return;

    value._selectedOptions.remove(option);
    notifyListeners();
  }

  /// select the options
  /// [MultiSelectController] is used to select the options.
  void setSelectedOptions(List<TreeNode> options) {

    if (options.any((element) => !value._options.contains(element))) {
      throw Exception('Cannot select options that are not in the options list');
    }

    value._selectedOptions.clear();
    value._selectedOptions.addAll(options);
    notifyListeners();
  }

  /// add selected option
  /// [MultiSelectController] is used to add selected option.
  void addSelectedOption(TreeNode option) {

    if (!value._options.contains(option)) {
      throw Exception('Cannot select option that is not in the options list');
    }

    value._selectedOptions.add(option);
    notifyListeners();
  }

  /// set options
  /// [MultiSelectController] is used to set options.
  void setOptions(List<TreeNode> options) {
    value._options.clear();
    value._options.addAll(options);
    notifyListeners();
  }

  // /// get enabled options
  // List<TreeNode> get enabledOptions => value._options
  //     .where((element) => !value._disabledOptions.contains(element))
  //     .toList();

  /// get options
  List<TreeNode> get options => value._options;

  /// get selected options
  List<TreeNode> get selectedOptions => value._selectedOptions;

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

enum TreeselectionType {
  singleSelect,
  MultiSelect,
}

class TreeNode {
  final String value;
  final List<TreeNode> children;

  TreeNode(this.value, this.children);
}

final List<TreeNode> rootNodes = [
  TreeNode('A', [
    TreeNode('A1', []),
    TreeNode('A2', []),
  ]),
  TreeNode('B', [
    TreeNode('B1', []),
    TreeNode('B2', []),
  ]),
];

class TreeNodeWidget extends StatefulWidget {
  final TreeNode option;
  final bool isSelected;
  final List<TreeNode> selectedOptions;
  final Color backgroundColor;
  final ValueChanged<List<TreeNode>> onOptionSelected;

  const TreeNodeWidget({
    Key? key,
    required this.option,
    required this.isSelected,
    required this.selectedOptions,
    required this.onOptionSelected,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  _TreeNodeWidgetState createState() => _TreeNodeWidgetState();
}

class _TreeNodeWidgetState extends State<TreeNodeWidget> {
  bool _isExpanded = false;

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
      selectedTileColor: const DigitColors().burningOrange,

      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      title: Column(
        children: [
          Row(
            children: [
              Transform.rotate(
                angle: _isExpanded ? 0: -1.5,
                child: Icon(Icons.arrow_drop_down, size: 24, color: const DigitColors().woodsmokeBlack,),
              ),
              const SizedBox(width: 4,),
              Text(
                widget.option.value,
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: const DigitColors().davyGray,
                ),
              ),
            ],
          ),
          if (_isExpanded && widget.option.children.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color
                          : const DigitColors().quillGray,
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
                    children: widget.option.children.map((child) {
                      bool isChildSelected = widget.selectedOptions.contains(child);
                      return TreeNodeWidget(
                        option: child,
                        isSelected: isChildSelected,
                        selectedOptions: widget.selectedOptions,
                        onOptionSelected: widget.onOptionSelected,
                        backgroundColor: widget.backgroundColor,
                      );
                    }).toList(),
                  ),
                ),
              ),
            ),
        ],
      ),
      // ... (rest of your ListTile properties)
      onTap: () {
        if(widget.option.children.isNotEmpty){
          setState(() {
            _isExpanded = !_isExpanded;
          });
        }

        if (widget.option.children.isNotEmpty) {
          widget.onOptionSelected(widget.selectedOptions);
        } else if (widget.isSelected) {
          widget.onOptionSelected([...widget.selectedOptions]..remove(widget.option));
        } else {
          widget.onOptionSelected([...widget.selectedOptions, widget.option]);
        }
      },
    );
  }
}


