import 'package:digit_components/digit_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'widget_app.dart';
import 'package:mocktail/mocktail.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route {}

class FakeDialogRoute<T> extends Fake implements DialogRoute<T> {}

void main() {
  const testButton = 'Test Button';
  group('Digit Icon Card Dialog', () {
    Future<void> buildTester(WidgetTester tester) async {
      final mockObserver = MockNavigatorObserver();

      List<DigitIconCard> getItems(
          BuildContext context, WalkthroughState state) {
        return state.walkthroughData.digiticoncards
            .map((e) => DigitIconCard(
                  key: GlobalObjectKey(e.widgetKey),
                  icon: IconData(e.icon, fontFamily: 'MaterialIcons'),
                  label: e.title,
                  onPressed: e.callback,
                ))
            .toList();
      }

      await tester.pumpWidget(WidgetApp(
        navigatorObserver: mockObserver,
        child: BlocBuilder<WalkthroughBloc, WalkthroughState>(
          builder: (context, state) {
            return Builder(
                builder: (context) => ScrollableContent(
                        header: Column(children: [
                          ElevatedButton(
                            onPressed: () {
                              DigitCardWalkthrough.show(context);
                            },
                            child: const Text(testButton),
                          )
                        ]),
                        children: [
                          Column(
                            children: getItems(context, state),
                          )
                        ]));
          },
        ),
      ));
    }

    setUpAll(() {
      registerFallbackValue(FakeRoute());
      registerFallbackValue(FakeDialogRoute());
      registerFallbackValue(FakeDialogRoute<bool>());
    });

    testWidgets('context builder renders dialog', (widgetTester) async {
      await buildTester(widgetTester);
      await widgetTester.tap(find.widgetWithText(ElevatedButton, testButton));
      await widgetTester.pumpAndSettle();
    });
  });
}
