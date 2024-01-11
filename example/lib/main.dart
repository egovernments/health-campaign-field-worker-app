import 'package:digit_components/digit_components.dart';
import 'package:digit_components/enum/app_enums.dart';
import 'package:digit_components/models/DropdownModels.dart';
import 'package:digit_components/models/DropdownModels.dart';
import 'package:digit_components/models/DropdownModels.dart';
import 'package:digit_components/models/RadioButtonModel.dart';
import 'package:digit_components/models/TreeModel.dart';
import 'package:digit_components/models/toggleButtonModel.dart';
import 'package:digit_components/utils/validators/validator.dart';
import 'package:digit_components/widgets/atoms/digit_base_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_button.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox.dart';
import 'package:digit_components/widgets/atoms/digit_checkbox_icon.dart';
import 'package:digit_components/widgets/atoms/digit_date_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_dropdown_input.dart'
    as dropdown;
import 'package:digit_components/widgets/atoms/digit_dropdown_input.dart';
import 'package:digit_components/widgets/atoms/digit_location_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_multiselect_dropdown.dart';
import 'package:digit_components/widgets/atoms/digit_numeric_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_password_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_radio_list.dart';
import 'package:digit_components/widgets/atoms/digit_search_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_text_area_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_text_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_time_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_toggle.dart';
import 'package:digit_components/widgets/atoms/digit_toggle_list.dart';
import 'package:digit_components/widgets/atoms/digit_tree_select_dropdown.dart';
import 'package:flutter/material.dart';

final List<TreeNode> Nodes = [
  TreeNode('A', 'A', [
    TreeNode('A.A1', 'A1', [
      TreeNode('A.A1.A3', 'A3', [
        TreeNode('A.A1.A3.A5', 'A5', []),
        TreeNode('A.A1.A3.A6', 'A6', []),
      ]),
      TreeNode('A.A1.A4', 'A4', []),
    ]),
    TreeNode('A.A2', 'A2', []),
  ]),
  TreeNode('B', 'B', [
    TreeNode('B.B1', 'B1', []),
    TreeNode('B.B2', 'B2', []),
  ]),
  TreeNode('C', 'C', [
    TreeNode('C.C1', 'C1', []),
    TreeNode('C.C2', 'C2', []),
  ]),
  TreeNode('D', 'D', [
    TreeNode('D.D1', 'D1', []),
    TreeNode('D.D2', 'D2', []),
  ]),
];

final TreeSelectController<int> _controller = TreeSelectController();
final controller = MultiSelectController<int>();

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ScrollableContent(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  DigitTextFormInput(
                    label: "input",
                    initialValue: 'value',
                    controller: TextEditingController(),

                    // state: 'Disabled',
                    // info: 'this is info',
                    innerLabel: 'label',
                    helpText: 'help text',
                    charCount: true,
                    validations: [
                      Validator(ValidatorType.maxLength, 10,
                          errorMessage: 'Maximum length is 10.'),
                      Validator(ValidatorType.pattern, r'^[a-zA-Z0-9]+$',
                          errorMessage: 'Invalid format.'),
                    ],
                    // onSuffixTap: (){print('tapppppppppp');},
                    // suffixIcon: Icons.currency_rupee_sharp,
                    // prefixIcon: Icons.currency_rupee,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DigitTextAreaFormInput(
                    label: "input",
                    controller: TextEditingController(),
                    // state: 'Disabled',
                    // info: 'this is info',
                    innerLabel: 'label',
                    helpText: 'help text',
                    // onSuffixTap: (){print('tapppppppppp');},
                    // suffixIcon: Icons.currency_rupee_sharp,
                    // prefixIcon: Icons.currency_rupee,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DigitDateFormInput(
                    label: "input",
                    controller: TextEditingController(),
                    // state: 'Disabled',
                    // info: 'this is info',
                    innerLabel: 'innerlabel',
                    helpText: 'help text',
                    // onSuffixTap: (){print('tapppppppppp');},
                    // suffixIcon: Icons.currency_rupee_sharp,
                    // prefixIcon: Icons.currency_rupee,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DigitTimeFormInput(
                    label: "input",
                    controller: TextEditingController(),
                    // state: 'Disabled',
                    // info: 'this is info',
                    innerLabel: 'innerlabel',
                    helpText: 'help text',
                    // onSuffixTap: (){print('tapppppppppp');},
                    // suffixIcon: Icons.currency_rupee_sharp,
                    // prefixIcon: Icons.currency_rupee,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DigitSearchFormInput(
                    label: "input",
                    controller: TextEditingController(),
                    // state: 'Disabled',
                    // info: 'this is info',
                    innerLabel: 'innerlabel',
                    helpText: 'help text',
                    // onSuffixTap: (){print('tapppppppppp');},
                    // suffixIcon: Icons.currency_rupee_sharp,
                    // prefixIcon: Icons.currency_rupee,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DigitPasswordFormInput(
                    label: "input",
                    controller: TextEditingController(),
                    innerLabel: 'innerlabel',
                    helpText: 'help text',
                    validations: [
                      Validator(ValidatorType.minLength, 6,
                          errorMessage:
                              'Password must be at least 6 characters.'),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  dropdown.DigitDropdown<int>(
                    onChange: (String value, String index) => {
                      print(value),
                      print(index),
                    },
                    textEditingController: TextEditingController(),
                    textIcon: Icons.article,
                    dropdownType: DropdownType.profileSelect,
                    items: const [
                      DropdownItem(
                        name: 'first',
                        code: '1',
                        description: 'description for first one',
                        profileImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzBXNuO6PezhC18aYH_2cYtS0I7KbxoKYdwA&usqp=CAU',
                        ),
                      ),
                      DropdownItem(
                        name: 'second',
                        code: '2',
                        description: 'description for second one',
                        profileImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzBXNuO6PezhC18aYH_2cYtS0I7KbxoKYdwA&usqp=CAU',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  dropdown.DigitDropdown<int>(
                    onChange: (String value, String index) => {
                      print(value),
                      print(index),
                    },
                    textEditingController: TextEditingController(),
                    textIcon: Icons.article,
                    items: [
                      'apple',
                      'banana',
                      'orange',
                      'grapes',
                    ]
                        .asMap()
                        .entries
                        .map(
                          (item) => DropdownItem(
                            name: item.value,
                            code: item.key.toString(),
                            description: 'description for ${item.value} one',
                          ),
                        )
                        .toList(),
                  ),
                  dropdown.DigitDropdown<int>(
                    onChange: (String value, String index) => {
                      print(value),
                      print(index),
                    },
                    textEditingController: TextEditingController(),
                    items: [
                      'apple',
                      'banana',
                      'orange',
                      'grapes',
                    ]
                        .asMap()
                        .entries
                        .map(
                          (item) => DropdownItem(
                            name: item.value,
                            code: item.key.toString(),
                          ),
                        )
                        .toList(),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DigitDropdown(
                    onChange: (String value, String type) => {
                      print(value),
                      print(type),
                    },
                    textEditingController: TextEditingController(),
                    dropdownType: DropdownType.nestedSelect,
                    items: const [
                      DropdownItem(
                        name: 'apple',
                        code: '1',
                        type: 'group B',
                      ),
                      DropdownItem(
                        name: 'grapes',
                        code: '2',
                        type: 'group A',
                      ),
                      DropdownItem(
                        name: 'banana',
                        code: '3',
                        type: 'group B',
                      ),
                      DropdownItem(
                        name: 'papaya',
                        code:'4',
                        type: 'group A',
                      ),
                      DropdownItem(
                        name: 'pine apple',
                        code: '4',
                        type: 'group B',
                      ),
                      DropdownItem(
                        name: 'watermelon',
                        code: '5',
                        type: 'group A',
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TreeSelectDropDown<int>(
                    onOptionSelected: (List<TreeNode> selectedOptions) {
                      // print(selectedOptions);
                      for (TreeNode node in selectedOptions) {
                        // print("Node: ${node.value}");
                      }
                    },
                    options: Nodes,
                    treeSelectionType: TreeSelectionType.MultiSelect,
                    // chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                    controller: _controller,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TreeSelectDropDown<int>(
                    onOptionSelected: (List<TreeNode> selectedOptions) {
                      // print(selectedOptions);
                      for (TreeNode node in selectedOptions) {
                        // print("Node: ${node.value}");
                      }
                    },
                    options: Nodes,
                    treeSelectionType: TreeSelectionType.singleSelect,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  MultiSelectDropDown<int>(
                    onOptionSelected:
                        (List<DropdownItem> selectedOptions) {},
                    options: const [
                      DropdownItem(code: '1', name: 'firstddddddddddddd'),
                      DropdownItem(
                          code: '2', name: 'seconddddddddddddddddd'),
                      DropdownItem(code: '3', name: 'thiraaaaaaaaaaaad'),
                      DropdownItem(code: '4', name: 'foussssssssr'),
                      DropdownItem(code: '5', name: 'fivssssssssssse'),
                    ],
                    selectionType: SelectionType.multiSelect,
                  ),
                  MultiSelectDropDown<int>(
                    onOptionSelected:
                        (List<DropdownItem> selectedOptions) {},
                    options: const [
                      DropdownItem(code: '1', name: 'firstddddddddddddd'),
                      DropdownItem(
                          code: '2', name: 'seconddddddddddddddddd'),
                      DropdownItem(code: '3', name: 'thiraaaaaaaaaaaad'),
                      DropdownItem(code: '4', name: 'foussssssssr'),
                      DropdownItem(code: '5', name: 'fivssssssssssse'),
                    ],
                    selectionType: SelectionType.multiSelect,
                    textIcon: Icons.article,
                  ),
                  MultiSelectDropDown<int>(
                    onOptionSelected:
                        (List<DropdownItem> selectedOptions) {},
                    options: const [
                      DropdownItem(
                        code: '1',
                        name: 'firstddddddddddddd',
                        description: 'ddddddddddddddddddddd',
                      ),
                      DropdownItem(
                        code: '2',
                        name: 'seconddddddddddddddddd',
                        description: 'ddddddddddddddddddddd',
                      ),
                      DropdownItem(
                        code: '3',
                        name: 'thiraaaaaaaaaaaad',
                        description: 'ddddddddddddddddddddd',
                      ),
                      DropdownItem(
                        code: '4',
                        name: 'foussssssssr',
                        description: 'ddddddddddddddddddddd',
                      ),
                      DropdownItem(
                        code: '5',
                        name: 'fivssssssssssse',
                        description: 'ddddddddddddddddddddd',
                      ),
                    ],
                    selectionType: SelectionType.multiSelect,
                    textIcon: Icons.article,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  MultiSelectDropDown<int>(
                    onOptionSelected:
                        (List<DropdownItem> selectedOptions) {},
                    options: const [
                      DropdownItem(
                        code: '1',
                        name: 'firstddddddddddddd',
                        type: 'aaaaa',
                      ),
                      DropdownItem(
                        code: '2',
                        name: 'seconddddddddddddddddd',
                        type: 'aaaaa',
                      ),
                      DropdownItem(
                        code: '3',
                        name: 'thiraaaaaaaaaaaad',
                        type: 'bbbbb',
                      ),
                      DropdownItem(
                        code: '4',
                        name: 'foussssssssr',
                        type: 'aaaaa',
                      ),
                      DropdownItem(
                        code: '5',
                        name: 'fivssssssssssse',
                        type: 'bbbbb',
                      ),
                    ],
                    selectionType: SelectionType.nestedMultiSelect,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DigitTextFormInput(
                    label: "input",
                    controller: TextEditingController(),
                    // state: 'Disabled',
                    // info: 'this is info',
                    innerLabel: 'innerlabel',
                    helpText: 'help text',
                    // isDisabled: true,
                    // onSuffixTap: (){print('tapppppppppp');},
                    suffixIcon: Icons.currency_rupee_sharp,
                    prefixIcon: Icons.currency_rupee,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DigitNumericFormInput(
                    label: "input",
                    controller: TextEditingController(),
                    // state: 'Disabled',
                    innerLabel: 'innerlabel',
                    helpText: 'help text',
                    initialValue: '0',
                    // readOnly: true,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  DigitLocationFormInput(
                    label: "input",
                    controller: TextEditingController(),
                    // state: 'Disabled',
                    // info: 'this is info',
                    innerLabel: 'innerlabel',
                    helpText: 'help text',
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DigitRadioList(
                    onChanged: (value) {
                      // print(value);
                    },
                    radioButtons: [
                      RadioButtonModel(
                        code: '1',
                        name: 'One',
                      ),
                      RadioButtonModel(code: '2', name: 'Two'),
                      RadioButtonModel(code: '3', name: 'Three'),
                      // Add more radio buttons as needed
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DigitToggleList(
                    toggleButtons: [
                      ToggleButtonModel(
                          name: 'Toggle 1',
                          key: 'key1',
                          onSelected: () {
                            print('Toggle 1 selected!');
                          }),
                      ToggleButtonModel(
                          name: 'Toggle 2',
                          key: 'key2',
                          onSelected: () {
                            print('Toggle 2 selected!');
                          }),
                      ToggleButtonModel(
                          name: 'Toggle 3',
                          key: 'key3',
                          onSelected: () {
                            print('Toggle 3 selected!');
                          }),
                    ],
                    onChanged: (selectedValues) {
                      print('Selected values: $selectedValues');
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  DigitButton(
                    prefixIcon: Icons.add,
                    label: 'Primary Button',
                    onPressed: () {
                      // Add your primary button logic here
                      print('Primary button pressed');
                    },
                    type: ButtonType.primary,
                  ),
                  const SizedBox(height: 16),
                  DigitButton(
                    label: 'Secondary Button',
                    onPressed: () {
                      // Add your secondary button logic here
                      print('Secondary button pressed');
                    },
                    type: ButtonType.secondary,
                  ),
                  const SizedBox(height: 16),
                  DigitButton(
                    label: 'Link',
                    onPressed: () {
                      // Add your secondary button logic here
                      print('link pressed');
                    },
                    type: ButtonType.link,
                  ),
                  const SizedBox(height: 16),
                  DigitButton(
                    label: 'tertiary Button',
                    onPressed: () {
                      // Add your secondary button logic here
                      print('tertiary button pressed');
                    },
                    type: ButtonType.tertiary,
                  ),
                  DigitButton(
                    prefixIcon: Icons.add,
                    label: 'Primary Button',
                    onPressed: () {
                      print('Primary button pressed');
                    },
                    type: ButtonType.primary,
                    isDisabled: true,
                  ),
                  const SizedBox(height: 16),
                  DigitButton(
                    label: 'Secondary Button',
                    onPressed: () {
                      print('Secondary button pressed');
                    },
                    isDisabled: true,
                    type: ButtonType.secondary,
                  ),
                  const SizedBox(height: 16),
                  DigitButton(
                    label: 'Link',
                    onPressed: () {
                      print('link pressed');
                    },
                    isDisabled: true,
                    type: ButtonType.link,
                  ),
                  const SizedBox(height: 16),
                  DigitButton(
                    label: 'tertiary Button',
                    onPressed: () {
                      print('tertiary button pressed');
                    },
                    isDisabled: true,
                    type: ButtonType.tertiary,
                  ),
                  const SizedBox(height: 16),
                  DigitCheckbox(
                    label: 'checkbox',
                    value: false,
                    onChanged: (value) {
                      print(value);
                    },
                  ),
                  const SizedBox(height: 16),
                  dropdown.DigitDropdown<int>(
                    onChange: (String value, String index) => {
                      print(value),
                      print(index),
                    },
                    textEditingController: TextEditingController(),
                    items: [
                      'apple',
                      'banana',
                      'orange',
                      'grapes',
                    ]
                        .asMap()
                        .entries
                        .map(
                          (item) => DropdownItem(
                            name: item.value,
                            code: item.key.toString(),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
