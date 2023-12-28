import 'package:digit_components/digit_components.dart';
import 'package:digit_components/utils/validators/validator.dart';
import 'package:digit_components/widgets/atoms/digit_base_form_input.dart';
import 'package:digit_components/widgets/atoms/digit_button.dart';
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
    TreeNode('A.A1', 'A1', [TreeNode('A.A1.A3', 'A3', [TreeNode('A.A1.A3.A5', 'A5', []),
      TreeNode('A.A1.A3.A6', 'A6', []),]),
      TreeNode('A.A1.A4', 'A4', []),]),
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


void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ScrollableContent(
          children: [
            DigitCard(
              child: Padding(
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
                      // onSuffixTap: (){print('tapppppppppp');},
                      // suffixIcon: Icons.currency_rupee_sharp,
                      // prefixIcon: Icons.currency_rupee,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    dropdown.DigitDropdown<int>(
                      onChange: (String value, String index) => {
                        print(value),
                        print(index),
                      },
                      dropdownStyle: const dropdown.DropdownStyle(
                        elevation: 6,
                        padding: EdgeInsets.all(5),
                      ),
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
                            (item) => dropdown.DropdownItem<String>(
                              value: item.value,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10, top: 12, bottom: 12,),
                                child: Text(item.value, style: const TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 14,),),
                              ),
                            ),
                          )
                          .toList(),
                      child: const Text(
                        'dropdown',
                      ),
                    ),
                    const SizedBox(height: 16,),
                    dropdown.DigitDropdown<int>(
                      onChange: (String value, String type) => {
                        print(value),
                        print(type),
                      },
                      dropdownStyle: const dropdown.DropdownStyle(
                        elevation: 6,
                        padding: EdgeInsets.all(5),
                      ),
                      textEditingController: TextEditingController(),
                      dropdownType: dropdown.DropdownType.nestedSelect,
                      items: const [  dropdown.DropdownItem<String>(
                          value: 'apple',
                          type: 'group B',
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, top: 12, bottom: 12,),
                            child: Text('apple', style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 14,),),
                          ),
                        ),
                        dropdown.DropdownItem<String>(
                          value: 'grapes',
                          type: 'group A',
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, top: 12, bottom: 12,),
                            child: Text('grapes', style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 14,),),
                          ),
                        ),
                        dropdown.DropdownItem<String>(
                          value: 'banana',
                          type: 'group B',
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, top: 12, bottom: 12,),
                            child: Text('banana', style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 14,),),
                          ),
                        ),
                        dropdown.DropdownItem<String>(
                          value: 'papaya',
                          type: 'group A',
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, top: 12, bottom: 12,),
                            child: Text('papaya', style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 14,),),
                          ),
                        ),
                        dropdown.DropdownItem<String>(
                          value: 'pine apple',
                          type: 'group B',
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, top: 12, bottom: 12,),
                            child: Text('pine apple', style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 14,),),
                          ),
                        ),
                        dropdown.DropdownItem<String>(
                          value: 'watermelon',
                          type: 'group A',
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, top: 12, bottom: 12,),
                            child: Text('watermelon', style: TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 14,),),
                          ),
                        ),
                      ],
                      child: const Text(
                        'dropdown',
                      ),
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
                      options:  Nodes,
                      treeselectionType: TreeselectionType.MultiSelect,
                      // chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                      controller: _controller,
                      optionTextStyle: const TextStyle(fontSize: 16),
                    ),
                    SizedBox(height: 16,),
                    TreeSelectDropDown<int>(
                      onOptionSelected: (List<TreeNode> selectedOptions) {
                        // print(selectedOptions);
                        for (TreeNode node in selectedOptions) {
                          // print("Node: ${node.value}");
                        }
                      },
                      options:  Nodes,
                      treeselectionType: TreeselectionType.singleSelect,
                      // chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                      optionTextStyle: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16,),
                    MultiSelectDropDown<int>(
                      onOptionSelected: (List<DropdownListItem> selectedOptions) {},
                      options:  const [
                        DropdownListItem(value: 1, label: 'firstddddddddddddd'),
                        DropdownListItem(value: 2, label: 'seconddddddddddddddddd'),
                        DropdownListItem(value: 3, label: 'thiraaaaaaaaaaaad'),
                        DropdownListItem(value: 4, label: 'foussssssssr'),
                        DropdownListItem(value: 5, label: 'fivssssssssssse'),
                      ],
                      selectionType: SelectionType.multiSelect,
                      // chipConfig: const ChipConfig(wrapType: WrapType.wrap),
                      optionTextStyle: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16,),
                    MultiSelectDropDown<int>(
                      onOptionSelected: (List<DropdownListItem> selectedOptions) {},
                      options:  const [
                        DropdownListItem(value: 1, label: 'firstddddddddddddd', type: 'aaaaa',),
                        DropdownListItem(value: 2, label: 'seconddddddddddddddddd', type: 'aaaaa',),
                        DropdownListItem(value: 3, label: 'thiraaaaaaaaaaaad', type: 'bbbbb',),
                        DropdownListItem(value: 4, label: 'foussssssssr', type: 'aaaaa',),
                        DropdownListItem(value: 5, label: 'fivssssssssssse', type: 'bbbbb',),
                      ],
                      selectionType: SelectionType.nestedMultiSelect,

                      optionTextStyle: const TextStyle(fontSize: 16),
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
                    CustomButton(
                      prefixIcon: Icons.add,
                      label: 'Primary Button',
                      onPressed: () {
                        // Add your primary button logic here
                        print('Primary button pressed');
                      },
                      type: ButtonType.primary,
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      label: 'Secondary Button',
                      onPressed: () {
                        // Add your secondary button logic here
                        print('Secondary button pressed');
                      },
                      type: ButtonType.secondary,
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      label: 'link',
                      onPressed: () {
                        // Add your secondary button logic here
                        print('link pressed');
                      },
                      type: ButtonType.link,
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      label: 'tertiary Button',
                      onPressed: () {
                        // Add your secondary button logic here
                        print('tertiary button pressed');
                      },
                      type: ButtonType.tertiary,
                    ),
                    CustomButton(
                      prefixIcon: Icons.add,
                      label: 'Primary Button',
                      onPressed: () {
                        print('Primary button pressed');
                      },
                      type: ButtonType.primary,
                      isDisabled: true,
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      label: 'Secondary Button',
                      onPressed: () {
                        print('Secondary button pressed');
                      },
                      isDisabled: true,
                      type: ButtonType.secondary,
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      label: 'link',
                      onPressed: () {
                        print('link pressed');
                      },
                      isDisabled: true,
                      type: ButtonType.link,
                    ),
                    const SizedBox(height: 16),
                    CustomButton(
                      label: 'tertiary Button',
                      onPressed: () {
                        print('tertiary button pressed');
                      },
                      isDisabled: true,
                      type: ButtonType.tertiary,
                    ),
                    const SizedBox(height: 16),
                    DigitCheckboxIcon(
                      state: CheckboxState.checked,
                      isDisabled: true,
                    ),
                    const SizedBox(height: 16),
                    DigitCheckboxIcon(
                      state: CheckboxState.unchecked,
                      isDisabled: true,
                    ),
                    const SizedBox(height: 16),
                    dropdown.DigitDropdown<int>(
                      onChange: (String value, String index) => {
                        print(value),
                        print(index),
                      },
                      dropdownStyle: const dropdown.DropdownStyle(
                        elevation: 6,
                        padding: EdgeInsets.all(5),
                      ),
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
                            (item) => dropdown.DropdownItem<String>(
                          value: item.value,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 12, bottom: 12,),
                            child: Text(item.value, style: const TextStyle(fontFamily: 'Roboto', fontWeight: FontWeight.w400, fontSize: 14,),),
                          ),
                        ),
                      )
                          .toList(),
                      child: const Text(
                        'dropdown',
                      ),
                    ),
                    DigitCheckboxIcon(
                      state: CheckboxState.intermediate,
                      isDisabled: true,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}



