# DIGIT Components

## DigitActionDialog : 
	A customizable dialog with multiple action buttons / widgets.
	
	Usage: 
	onPressed : () => DigitActionDialog.show(
 context,
 widget: your_widget()
)

DigitCheckBox : 
	A single checkbox component.
	
	Usage: 
	DigitCheckbox(
 		label: “your_label”,
 		value: boolean_value,
),

DigitDateFormPicker : 
	A Reactive Date Picker widget with custom label header. The formControlName is required to bind this ReactiveDatePicker to a FormControl.
	
	Usage: 
	DigitDateFormPicker(
 label: t.translate(i18.common.dateOfBirth),
 padding: const EdgeInsets.only(top: 32.0),
 isRequired: true,
 cancelText: t.translate(i18.common.cancel),
 fieldHintText: 'dd/mm/yyyy',
 confirmText: t.translate(i18.common.oK),
 icon: Icons.info_outline_rounded,
 toolTipMsg: t.translate(i18.wageSeeker.ageValidation),
 formControlName: ’dob_key’,
 autoValidation: AutovalidateMode.always,
 requiredMessage:
     t.translate(i18.wageSeeker.dobRequired),
 validationMessages: {
   'required': (_) => ‘Date of birth is required’,
   'max': (_) => ‘Age cannot be greater than 18 years’
 },)
DigitDivider : 
	A simple divider widget
	
	Usage: 
	DigitDivider()
DigitDropdown : 
	A custom dropdown component with label header.
	
	Usage: 
	DigitDropdown<YOUR_DATA_TYPE>(
 value: state.selectedBoundaryMap.entries
     .firstWhereOrNull(
       (element) => element.key == label,
     )
     ?.value,
 label: label,
 menuItems: your_item_list,
 onChanged: (value) {
   if (value == null) return;
		//Any functions to perform on change or on select of the dropdown
 },
 valueMapper: (value) {
   return value.name ?? value.code ?? 'No Value';
 },)

DigitIconButton : 
	A custom icon widget with customizable icon, icon Text, icon color, icon Text Color
	
	Usage: 
	DigitIconButton(
 icon: Icons.check_circle,
 iconText: 'delivered',
 iconTextColor: Colors.white,
 iconColor: Colors.orange,
)

DigitIntegerFormPicker : 
	An Integer Picker with option to select any number by increasing or decreasing the using + and - end buttons 
	


Usage: 
	DigitIntegerFormPicker(
 form: form,
 minimum: 0,
 formControlName: _quantityDistributedKey,
 label: ‘Number of members’,
 incrementer: true,
),
DigitOutlineIconButton : 
	An outlined button with a leading icon based on DIGIT figma.
	
	Usage: 
	DigitOutlineIconButton(
 icon: Icons.warning,
 label:’Decline’,
 onPressed: () => call_your_on_pressed_function(),
)

DigitReactiveDropdown : 
	A reactive dropdown form component. The formControlName is required to bind this ReactiveDropdownField to a FormControl
	
	Usage: 
	DigitReactiveDropdown<String>(
 label: ‘relationship’,
 menuItems:
     relationship.map((e) => e.toString()).toList(),
 isRequired: true,
 formControlName: relationshipKey,
 valueMapper: (value) =>
     t.translate('CORE_COMMON_$value'),
 onChanged: (value) {},
 validationMessages: {
   'required': (_) => t.translate(
         i18.wageSeeker.relationshipRequired,
       ),
 },
)

DigitTextFormField : 
	A reactive form reactive dropdown component. The formControlName is required to bind this ReactiveTextField  to a FormControl
	
	Usage: 
	DigitTextFormField(
 formControlName: fatherNameKey,
 isRequired: true,
 label: t.translate(i18.common.guardianName),
 inputFormatter: [
   FilteringTextInputFormatter.allow(RegExp("[A-Za-z ]"))
 ],
 validationMessages: {
   'required': (_) => t.translate(
         i18.wageSeeker.fatherNameRequired,
       ),
   'minLength': (_) => t.translate(
         i18.wageSeeker.minFatherNameCharacters,
       ),
   'maxLength': (_) => t.translate(
         i18.wageSeeker.maxFatherNameCharacters,
       ),
 },
)
DigitToast : 
	To show a toast message based on completion of user actions
	
	Usage: 
	DigitToast.show(
 context,
 options: DigitToastOptions(
   message ?? 'Unable to login',
   true,
   theme,
 ),
);
DigitCard : 
	A Card component with onPressed functions
	
	Usage: 
	DigitCard(
 	child: Text(‘Card Details’),
onPressed: null)



DigitCheckBoxTile : 
	It is a List of checkbox widgets, with label heading
	
	
Usage: 
	DigitCheckboxTile(
 margin: const EdgeInsets.only(top: 16),
 padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
 label: hint ?? 'Some',
 value: (control.value ?? false) as bool,
 onChanged: (value) => control.value = value,
)

DigitDialog : 
	A customizable dialog with options to add a custom title for the dialog , subtitle for the dialog and action buttons. It can be used on any on Pressed buttons to show this dialog
	
	
Usage: 
	() => DigitDialog.show(context,
   options: DigitDialogOptions(
       titleIcon: const Icon(
         Icons.warning,
         color: Colors.red,
       ),
       titleText: ‘Warning’
       contentText: ‘Are you sure to decline ?’,
       primaryAction: DigitDialogActions(
         label: ‘Confirm’,
         action: (BuildContext context) {
           //your_primary_action();
         },
       ),
       secondaryAction: DigitDialogActions(
         label: ‘Cancel’,
         action: (BuildContext context) =>
             //your_secondary_action(),
       )));



DigitDobPicker : 
	It is an enhanced component of DigitDateFormPicker. Here we have an additional Text field component which will be displaying the age based on the selected date and validate the age.
	
	Usage: 
DigitDobPicker(
 datePickerFormControl: _dobKey,
 datePickerLabel: localizations.translate(
   i18.individualDetails.dobLabelText,
 ),
 ageFieldLabel: localizations.translate(
   i18.individualDetails.ageLabelText,
 ),
 separatorLabel: localizations.translate(
   i18.individualDetails.separatorLabelText,
 ),
),

DigitElevatedButton : 
	It is an elevated button with label widget options and onPressed functions based on DIGIT Figma
	
	Usage: 
DigitElevatedButton(
 onPressed: ()=> your_on_Pressed_function(),
 child: Center(
   child: Text(
      		‘Manage wage seekers’,
       style: Theme.of(context)
           .textTheme
           .titleMedium!
           .apply(color: Colors.white)),
 ),);








DigitIconTile : 
	A custom list tile widget with options to add leading icon and onPressed function. Mostly it is used in Sidebar tiles.
	
	Usage: 
DigitIconTile(
   title: ‘View Profile’,
   selected: context.router.currentPath.contains('orgProfile'),
   icon: Icons.perm_contact_cal_sharp,
   onPressed: () => your_on_pressed_function())

DigitInfoCard : 
	A custom information card based on DIGIT Figma. Here we have options to add the desired icon, background color, icon color, description and heading title of the information card.
	
	Usage: 
DigitInfoCard(
   icon: Icons.info,
   backgroundColor: theme.colorScheme.tertiaryContainer,
   iconColor: theme.colorScheme.surfaceTint,
   description: localizations
       .translate(i18.home.dataSyncInfoContent)
       .replaceAll('{}', count.toString()),
   title: localizations.translate(
     i18.home.dataSyncInfoLabel,
   ),
 ),

DigitOutlineButton : 
	An outlined button based on DIGIT figma.
	
	Usage: 
	DigitOutLineButton(
   label: localizations.translate(
     i18.memberCard.deliverDetailsUpdateLabel,
   ),
   onPressed: () => your_on_pressed_function(),
 )

DigitReactiveTypeAhead : 
A TypeAhead (autocomplete) widget , where you can show suggestions to users as they type
	
	Usage: 
	DigitReactiveTypeAhead<T, T>(
 formControlName: formControlName,
 stringify: valueMapper,
 initialValue: initialValue,
 initialValueText: initialValueText,
 onSuggestionSelected: onSuggestionSelected,
 debounceDuration: const Duration(milliseconds: 100),
 suggestionsCallback: (pattern) => suggestionsCallback(
   menuItems,
   pattern,
 ),
 itemBuilder: (context, item) {
   return Padding(
     padding: const EdgeInsets.all(kPadding * 2),
     child: Text(
       valueMapper(item),
       style: Theme.of(context).textTheme.bodyLarge,
     ),
   );
 },
)

DigitSearchBar : 
	A search bar based on DIGIT figma. It has on change functionality to perform actions on text change. A hint text can also be added on the search bar 
	
	Usage: 
	DigitSearchBar(
 controller: searchController,
 hintText: localizations.translate(
   i18.searchBeneficiary.beneficiarySearchHintText,
 ),
 textCapitalization: TextCapitalization.words,
 onChanged: (value) => your_on_change_function()
),
DigitSearchDropdown : 
	A searchable drop down that wraps DigitReactiveTypeAhead and has a custom label widget.
	
	Usage: 
	DigitSearchDropdown<T, T>(
	 label: ‘City’
 formControlName: formControlName,
 stringify: valueMapper,
 initialValue: initialValue,
 initialValueText: initialValueText,
 onSuggestionSelected: onSuggestionSelected,
 debounceDuration: const Duration(milliseconds: 100),
 suggestionsCallback: (pattern) => suggestionsCallback(
   menuItems,
   pattern,
 ),
 itemBuilder: (context, item) {
   return Padding(
     padding: const EdgeInsets.all(kPadding * 2),
     child: Text(
       valueMapper(item),
       style: Theme.of(context).textTheme.bodyLarge,
     ),
   );
 },
)

DigitSyncDialogContent : 
	A sync dialog with options to add a custom label for the dialog , and type of the dialog. There are 3 types of sync dialog :	
In Progress
Completed
Failed
	
Usage: 
	() => DigitSyncDialogContent.show(
 context,
 type: DigitSyncDialogType.complete,
 label: 'Data Synced',
 primaryAction: DigitDialogActions(
   label: 'Close',
   action: (act) {
     Navigator.pop(act);
   },
 ),
);





DigitTextField : 
	A text field component similar to DigitTextFormField. It can be used without wrapping under reactive form
	
	Usage: 
	DigitTextField(
 readOnly: true,
 label: localizations.translate(
   i18.householdLocation.administrationAreaFormLabel,
 ),
 controller: TextEditingController(
   text: context.boundary.code,
 ),
),

LabeledField : 
	A labeled widget which has a child widget. If any field need to have a label on its top, then that widget can be wrapped with this LabeledField.
	
	Usage: 
	LabeledField(
 label: '$label ${isRequired ? '*' : ''}',
 padding: padding,
 labelStyle: Theme.of(context).textTheme.bodyLarge,
 icon: icon,
 toolTipMsg: toolTipMsg,
 child: ReactiveDatePicker())
PoweredByDigit : 
	Generic Digit Footer. 
	
	Usage: 
	PoweredByDigit(
 isWhiteLogo: true,
)






ScrollableContent : 
	A Scrollable wrapper widget. All children widgets can be wrapped inside a single scroll card.
	
	Usage: 
	ScrollableContent(
 header: Column(children: const [
   Back(),
   DigitCard(),
 ]),
 footer: PoweredByDigit()
)

