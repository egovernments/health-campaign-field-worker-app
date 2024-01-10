import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import '../../enum/app_enums.dart';
import '../../models/TreeModel.dart';
import '../atoms/digit_checkbox_icon.dart';

class TreeNodeWidget extends StatefulWidget {
  final TreeNode option;
  final TreeNode currentOption;
  final bool isSelected;
  final List<TreeNode> selectedOptions;
  final Color backgroundColor;
  final ValueChanged<List<TreeNode>> onOptionSelected;
  final FocusNode focusNode;
  final TreeSelectionType treeSelectionType;

  const TreeNodeWidget({
    Key? key,
    required this.option,
    required this.currentOption,
    required this.isSelected,
    required this.selectedOptions,
    required this.onOptionSelected,
    required this.backgroundColor,
    required this.focusNode,
    required this.treeSelectionType,
  }) : super(key: key);

  @override
  _TreeNodeWidgetState createState() => _TreeNodeWidgetState();
}

class _TreeNodeWidgetState extends State<TreeNodeWidget> {
  bool _isExpanded = false;
  bool _isSelected = false;

  /// Update _areAllChildrenSelected method in _TreeNodeWidgetState
  bool _areAllChildrenSelected(TreeNode node) {
    if (node.children.isEmpty) {
      return widget.selectedOptions.any((item) => item.code == node.code);
    }

    return node.children.every((child) => _areAllChildrenSelected(child));
  }

  /// Update _isAnyChildSelected method in _TreeNodeWidgetState
  bool _isAnyChildSelected(TreeNode node) {
    return node.children.any((child) =>
        widget.selectedOptions.any((item) => item.code == child.code) ||
        _isAnyChildSelected(child));
  }

  /// Update _selectAllChildren method in _TreeNodeWidgetState
  void _selectAllChildren(TreeNode node) {
    if (node.children.isEmpty) {
      if (!widget.selectedOptions.any((item) => item.code == node.code)) {
        widget.onOptionSelected([...widget.selectedOptions, node]);
      }
    } else {
      for (final child in node.children) {
        _selectAllChildren(child);
      }
    }
  }

  /// Update _deselectAllChildren method in _TreeNodeWidgetState
  void _deselectAllChildren(TreeNode node) {
    if (node.children.isEmpty) {
      widget.onOptionSelected([...widget.selectedOptions]
        ..removeWhere((item) => item.code == node.code));
    } else {
      for (final child in node.children) {
        _deselectAllChildren(child);
      }
    }
  }

  bool _selected(TreeNode node) {
    return widget.selectedOptions.any((item) => item.code == node.code);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedColor: Colors.transparent,
      selected: _selected(widget.currentOption),
      autofocus: false,
      hoverColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
      tileColor: widget.backgroundColor,
      textColor: const DigitColors().davyGray,
      selectedTileColor:
          widget.treeSelectionType == TreeSelectionType.singleSelect
              ? const DigitColors().burningOrange
              : const DigitColors().white,
      contentPadding: _isExpanded
          ? const EdgeInsets.only(top: 4, bottom: 4)
          : const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
              if (widget.treeSelectionType == TreeSelectionType.MultiSelect)
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
                      ? const DigitCheckboxIcon(
                          state: CheckboxState.checked,
                        )
                      : _isAnyChildSelected(widget.currentOption)
                          ? const DigitCheckboxIcon(
                              state: CheckboxState.intermediate)
                          : const DigitCheckboxIcon(
                              state: CheckboxState.unchecked),
                ),
              const SizedBox(
                width: 4,
              ),
              Text(
                widget.currentOption.name,
                style: DigitTheme.instance.mobileTheme.textTheme.headlineSmall
                    ?.copyWith(
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
                        treeSelectionType: widget.treeSelectionType,
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
            .any((item) => item.code == widget.currentOption.code)) {
          widget.onOptionSelected([...widget.selectedOptions]
            ..removeWhere((item) => item.code == widget.currentOption.code));
        } else {
          if (widget.treeSelectionType == TreeSelectionType.MultiSelect) {
            if (!widget.selectedOptions
                .any((item) => item.code == widget.currentOption.code)) {
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
