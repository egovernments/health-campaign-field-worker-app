// Importing the Material Design visual, motion, and interaction design library.
import 'package:flutter/material.dart';

// A stateless widget that can be extended with a custom widget and a custom method.
class CustomExtensionWidgetPage extends StatelessWidget {
  // The custom widget that will be displayed in the column.
  // If no custom widget is provided, a text widget with the message 'No custom widget provided' will be displayed.
  final Widget? customWidget;

  // The custom method that will be executed when the button is pressed.
  // If no custom method is provided, the button will not do anything when pressed.
  final Function? customMethod;

  // Constructor for the CustomExtensionWidgetPage class.
  // Requires a custom widget and optionally accepts a custom method.
  const CustomExtensionWidgetPage(
      {super.key, required this.customWidget, this.customMethod});

  // Describes the part of the user interface represented by this widget.
  // The build method for this widget returns a column containing the custom widget and a button.
  // When the button is pressed, the custom method is executed.
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // If a custom widget is provided, it is displayed here.
        // If no custom widget is provided, a text widget with the message 'No custom widget provided' is displayed.
        customWidget ?? const Text('No custom widget provided'),

        // A button that, when pressed, executes the custom method.
        ElevatedButton(
            onPressed: () {
              // If a custom method is provided, it is executed here.
              // If no custom method is provided, nothing happens.
              customMethod!(context);
            },
            // The button displays the text 'Custom button'.
            child: const Text('Custom button')),
      ],
    );
  }
}
