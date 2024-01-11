library multiselect_dropdown;

import 'package:digit_components/digit_components.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../constants/AppView.dart';
import '../../constants/app_constants.dart';
import '../../enum/app_enums.dart';
import '../../models/TreeModel.dart';
import '../../models/chipModel.dart';
import '../helper_widget/selection_chip.dart';
import '../helper_widget/tree_node_widget.dart';

/// The TreeSelectDropDown component is a Flutter dropdown widget with tree-like structure, allowing the selection of multiple or single options
/// It initializes the options, selected options, and other configurations.
/// It supports the integration of a TreeSelectController for programmatically controlling the dropdown.
/// It provides customization options for the appearance of the dropdown, chips, and other elements.
///
/// Example usage:
/// ```dart
///
/// TreeSelectDropDown<int>(
///             // Provide the list of options
///             options: options,
///             // Provide the initially selected options
///             selectedOptions: selectedOptions,
///             // Define the callback function when options are selected/deselected
///             onOptionSelected: (List<TreeNode> selectedItems) {
///               // Handle the selected items
///               setState(() {
///                 selectedOptions = selectedItems;
///               });
///             },
///             // Customize the appearance of chips
///             chipConfig: ChipConfig(),
///             // Customize the suffix icon (dropdown arrow)
///             suffixIcon: Icon(Icons.arrow_drop_down),
///             // Customize the selection type (multiSelect or singleSelect)
///             treeSelectionType: TreeSelectionType.multiSelect,
///           ),
///

typedef OnOptionSelected<T> = void Function(List<TreeNode> selectedOptions);

class TreeSelectDropDown<int> extends StatefulWidget {
  /// selection type of the dropdown
  final TreeSelectionType treeSelectionType;

  /// Options
  final List<TreeNode> options;
  final List<TreeNode> selectedOptions;
  final OnOptionSelected<int>? onOptionSelected;

  final ChipConfig chipConfig;

  /// dropdownfield configuration
  final Icon? suffixIcon;
  final Decoration? inputDecoration;

  /// focus node
  final FocusNode? focusNode;

  /// Controller for the dropdown
  /// [controller] is the controller for the dropdown. It can be used to programmatically open and close the dropdown.
  final TreeSelectController<int>? controller;

  const TreeSelectDropDown({
    Key? key,
    required this.onOptionSelected,
    required this.options,
    this.treeSelectionType = TreeSelectionType.MultiSelect,
    this.selectedOptions = const [],
    this.chipConfig = const ChipConfig(),
    this.suffixIcon = const Icon(Icons.arrow_drop_down),
    this.inputDecoration,
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

    ///calculate the dropdown width based on the view
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
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              hoverColor: Colors.transparent,
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
                            ? (widget.treeSelectionType ==
                                    TreeSelectionType.MultiSelect)
                                ? Text('${_selectedOptions.length} Selected')
                                : Text(_selectedOptions.first.code.toString())
                            : const SizedBox(),
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
        if (_anyItemSelected &&
            widget.treeSelectionType == TreeSelectionType.MultiSelect)
          SizedBox(
            width: dropdownWidth,
            child: _getContainerContent(),
          )
      ],
    );
  }

  /// Container Content for the dropdown.
  Widget _getContainerContent() {
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

          Widget chip = _buildChip(item, widget.chipConfig);

          return chip;
        }),
        if (_selectedOptions
            .isNotEmpty) /// Display "Clear All" only if there are selected options
          InkWell(
            onTap: () => clear(), /// onTap Clear all the
            child: Chip(
              backgroundColor: const DigitColors().white,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: const DigitColors().burningOrange,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              padding:
                  const EdgeInsets.symmetric(horizontal: kPadding,),
              labelPadding: const EdgeInsets.symmetric(vertical: kPadding/4),
              label: Text('Clear All',
                  style: TextStyle(color: const DigitColors().burningOrange)),
            ),
          ),
      ],
    );
  }

  /// Build the selected item chip.
  Widget _buildChip(TreeNode item, ChipConfig chipConfig) {
    return SelectionChip<T>(
      item: item,
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
                shadowColor: null,
                clipBehavior: Clip.none,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: SizedBox(
                    width: size.width,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildFlatOptions(
                            values, options, selectedOptions, dropdownState),
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

  Widget _buildFlatOptions(List<dynamic> values, List<TreeNode> options,
      List<TreeNode> selectedOptions, StateSetter dropdownState) {
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
          bool isSelected =
              selectedOptions.any((item) => item.name == option.name);
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
      treeSelectionType: widget.treeSelectionType,
      onOptionSelected: (updatedOptions) {
        if (widget.treeSelectionType == TreeSelectionType.MultiSelect) {
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

/// TreeSelect Controller class.
/// This class is used to control the state of the TreeSelectDropdown widget.
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
        .any((item) => item.code == option.code && item.name == option.name)) {
      return;
    }
    value._selectedOptions.removeWhere(
        (item) => item.code == option.code && item.name == option.name);
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