# Digit Showcase

The showcase widget is a wrapper widget that provides a way to highlight or showcase a widget. It is useful for highlighting a widget in a list of widgets or provide a functionality to provide visual help to understand the functionality of the widget.

## Features

- Provides a showcase or highlight of the wrapped widget.

## Getting started

To use this package, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  digit_showcase: ^latest
```

## Usage

Wrap the top layer of your widget tree with the `Showcase` widget.

```dart
ShowcaseWidget(
enableAutoScroll: true,
builder: Builder(
builder: (context) {
}
);
```
Provide localizations for the showcase widget.

```dart
  final date = ShowcaseItemBuilder(
    messageLocalizationKey: i18.showcase_date.date,
  );
```

Now use .buildWith to build the showcase widget.

```dart
date.buildWith(child: Text('Date'));
```

Explore the package for more showcase items and their usage.