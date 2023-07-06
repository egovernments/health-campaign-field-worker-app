# **DIGIT Components**

**DigitActionDialog** : 
	A customizable dialog with multiple action buttons / widgets.
	
	Usage: 
	onPressed : () => DigitActionDialog.show(
	 context,
	 widget: your_widget()
	)
 <img width="164" alt="Digit Action Dialog" src="https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/daa1607a-b91c-442c-8a65-da39479f2d34">


**DigitCheckBox** : 
	A single checkbox component.
	
	Usage: 
	DigitCheckbox(
 		label: “your_label”,
 		value: boolean_value,
	),
![CheckBox](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/e1c9a6d1-cb0c-4b95-9dea-dddd6ff98f17)

**DigitDateFormPicker** : 
	A Reactive Date Picker widget with custom label header. The formControlName is required to bind this ReactiveDatePicker to a FormControl.
	
	Usage: 
	DigitDateFormPicker(
     label: 'Date of Birth',
     padding: const EdgeInsets.only(top: 32.0),
     isRequired: true,
     cancelText: 'Cancel',
     fieldHintText: 'dd/mm/yyyy',
     confirmText: 'OK',
     icon: Icons.info_outline_rounded,
     toolTipMsg: 'Age should not be less than 18 years',
     formControlName: ’dob_key’,
     autoValidation: AutovalidateMode.always,
     requiredMessage: 'Date of birth is required',
     validationMessages: {
       'required': (_) => ‘Date of birth is required’,
       'max': (_) => ‘Age cannot be greater than 18 years’
     },)
     ![Date Form Picker](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/f57b3624-e047-4ca3-b383-fb166ea9330b)  <img width="166" alt="Date Picker" src="https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/dff63b96-0d92-4ae7-b4e5-547d14954d3b">


 **DigitDivider** : 
	A simple divider widget
	
	Usage: 
	DigitDivider()
![Divider](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/27656b6c-177e-48eb-8a23-fd0081ea3a59)

**DigitDropdown** : 
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
<img width="168" alt="Dropdown Field" src="https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/e0cb30b7-bb90-4e66-b4aa-64a74d3d447b">
<img width="196" alt="Digit Dropdown" src="https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/5e6c5aa0-a73e-45b7-93fc-cb32f0351763">

**DigitIconButton** : 
	A custom icon widget with customizable icon, icon Text, icon color, icon Text Color
	
	Usage: 
	DigitIconButton(
     icon: Icons.check_circle,
     iconText: 'delivered',
     iconTextColor: Colors.white,
     iconColor: Colors.orange,
    )
![DigitIcon Button](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/03cb82f3-500e-41c9-bdb4-f0bfb9b8b7ae)

**DigitIntegerFormPicker** : 
	An Integer Picker with option to select any number by increasing or decreasing the using + and - end buttons 
	


    Usage: 
        DigitIntegerFormPicker(
     form: form,
     minimum: 0,
     formControlName: _quantityDistributedKey,
     label: ‘Number of members’,
     incrementer: true,
    ),
    ![Digit Integer Form Picker](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/dc948cb6-3c2d-4660-8e33-c8d05b6d442f)

**DigitOutlineIconButton** : 
	An outlined button with a leading icon based on DIGIT figma.
	
	Usage: 
	DigitOutlineIconButton(
     icon: Icons.warning,
     label:’Decline’,
     onPressed: () => call_your_on_pressed_function(),
    )
    <img width="122" alt="DigitOutlineIcon Button" src="https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/0c51c733-5f6a-4b0f-9e41-870d6c896c4c">


**DigitReactiveDropdown** : 
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
![DigitReactive Type ahead](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/ff5ea5c4-2c9b-4340-a03e-456b4b762894)

**DigitTextFormField** : 
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
    <img width="148" alt="Digit Text Form Field" src="https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/915b27d1-6403-4986-bc65-b81d0202d2c9">
![Digit TextFormField](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/0f624e87-a5c5-4513-9b3e-3e36de6f3432)

**DigitToast** : 
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
    ![Digit Toast](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/ece6d835-98f5-4d54-80c5-7a540bbf80ce)


**DigitCard** : 
	A Card component with onPressed functions
	
	Usage: 
	DigitCard(
 	child: Text(‘Card Details’),
    onPressed: null)

![Digit Card](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/92a201dc-47a0-42e4-a085-e5faec0d6de5)


**DigitCheckBoxTile** : 
	It is a List of checkbox widgets, with label heading
	
	
    Usage: 
        DigitCheckboxTile(
     margin: const EdgeInsets.only(top: 16),
     padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
     label: hint ?? 'Some',
     value: (control.value ?? false) as bool,
     onChanged: (value) => control.value = value,
    )
    ![CheckBox List Tile](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/46ca9583-c81b-4c0c-977a-587787a46e6d)


**DigitDialog** : 
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

<img width="162" alt="Digit Dialog" src="https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/b41dd881-3dff-4248-8ca1-685fb69bbe44">


**DigitDobPicker** : 
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
    ![DOB Picker](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/4285923c-3896-45f4-99b6-48dbb2e45255)


**DigitElevatedButton** : 
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

     <img width="164" alt="Digit Elevated Button" src="https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/dda59e4d-bb06-4352-bd31-76a75a3e58f1">


**DigitIconTile** : 
	A custom list tile widget with options to add leading icon and onPressed function. Mostly it is used in Sidebar tiles.
	
	Usage: 
    DigitIconTile(
       title: ‘View Profile’,
       selected: context.router.currentPath.contains('orgProfile'),
       icon: Icons.perm_contact_cal_sharp,
       onPressed: () => your_on_pressed_function())

       <img width="163" alt="DigitIconTile" src="https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/a559d8a7-34f1-4df6-b89f-05666400c432">


**DigitInfoCard** : 
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

![Digit Info Card](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/104d3f92-73c3-4800-b6ac-b1cd22af1ad4)

**DigitOutlineButton** : 
	An outlined button based on DIGIT figma.
	
	Usage: 
	DigitOutLineButton(
       label: localizations.translate(
         i18.memberCard.deliverDetailsUpdateLabel,
       ),
       onPressed: () => your_on_pressed_function(),
     )
<img width="81" alt="DigitOutline button" src="https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/2d85702b-619d-49db-9ae7-5d04154c5d59">

**DigitReactiveTypeAhead** : 
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
![DigitReactive Type ahead](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/ed1426eb-d0ce-4b72-9391-5c51a8ca566c)

**DigitSearchBar** : 
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

![Digit Search Bar](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/6f5bb44f-49f4-4710-9349-a794294d46f5)

**DigitSearchDropdown** : 
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

    ![Digit Search Dropdown](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/ef8742e5-88fb-4647-9a4e-7458346844e3)


**DigitSyncDialogContent** : 
	A sync dialog with options to add a custom label for the dialog , and type of the dialog. There are 3 types of sync dialog :
    **In Progress**
    **Completed**
    **Failed**
	
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
    ![Digit SyncDialog](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/003aded5-e727-448d-a043-f01556c6ec84)


**DigitTextField** : 
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
    <img width="148" alt="Digit Text Form Field" src="https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/3abd2bb7-c918-4661-b41a-55276d326a72">


**LabeledField** : 
	A labeled widget which has a child widget. If any field need to have a label on its top, then that widget can be wrapped with this LabeledField.
	
	Usage: 
	LabeledField(
     label: '$label ${isRequired ? '*' : ''}',
     padding: padding,
     labelStyle: Theme.of(context).textTheme.bodyLarge,
     icon: icon,
     toolTipMsg: toolTipMsg,
     child: ReactiveDatePicker())

<img width="148" alt="Digit Text Form Field" src="https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/367e5118-0a81-4729-9c8f-62a2ff592170">
![Digit Integer Form Picker](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/d7aa0b99-07bf-4712-bb8d-042da71340d2)
![Date Form Picker](https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/ebd1f5ad-8dda-44d0-96a2-1eed11d2458a)


**PoweredByDigit** : 
	Generic Digit Footer. 
	
	Usage: 
	PoweredByDigit(
     isWhiteLogo: true,
    )
    <img width="131" alt="Powered By Digit Colored" src="https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/f2e3c5ae-1ca5-47de-b671-210dd1f83ff8">
    <img width="158" alt="Powered By Digit White" src="https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/ddc1d71a-82d7-41f8-8d73-c142a5c1a838">


**ScrollableContent** : 
	A Scrollable wrapper widget. All children widgets can be wrapped inside a single scroll card.
	
	Usage: 
	ScrollableContent(
     header: Column(children: const [
       Back(),
       DigitCard(),
     ]),
     footer: PoweredByDigit()
    )
<img width="180" alt="Scrollable Content" src="https://github.com/egovernments/health-campaign-field-worker-app/assets/85437265/6936c29d-6b0a-4665-b6c9-8bb3dcb7a853">

