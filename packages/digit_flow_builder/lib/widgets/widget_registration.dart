import 'package:digit_flow_builder/widgets/implementations/back_link.dart';

import 'flow_widget_interface.dart';
import 'implementations/action_popup_widget.dart';
import 'implementations/button_widget.dart';
import 'implementations/card_widget.dart';
import 'implementations/column_widget.dart';
import 'implementations/filter_widget.dart';
import 'implementations/info_card_widget.dart';
import 'implementations/label_pair_list_widget.dart';
import 'implementations/list_view_widget.dart';
import 'implementations/panel_card_widget.dart';
import 'implementations/row_widget.dart';
import 'implementations/search_bar_widget.dart';
import 'implementations/selection_card.dart';
import 'implementations/switch_widget.dart';
import 'implementations/table_widget.dart';
import 'implementations/tag_widget.dart';
import 'implementations/text_widget.dart';

/// Registers all available flow widgets
class WidgetRegistration {
  static bool _initialized = false;

  /// Initialize and register all widgets
  static void initialize() {
    if (_initialized) return;

    // Register all widget implementations
    FlowWidgetFactory.register(ActionPopupWidget());
    FlowWidgetFactory.register(ButtonWidget());
    FlowWidgetFactory.register(TextWidget());
    FlowWidgetFactory.register(CardWidget());
    FlowWidgetFactory.register(TableWidget());
    FlowWidgetFactory.register(SearchBarWidget());
    FlowWidgetFactory.register(SelectionCardWidget());
    FlowWidgetFactory.register(ColumnWidget());
    FlowWidgetFactory.register(RowWidget());
    FlowWidgetFactory.register(FilterWidget());
    FlowWidgetFactory.register(InfoCardWidget());
    FlowWidgetFactory.register(SwitchWidget());
    FlowWidgetFactory.register(TagWidget());
    FlowWidgetFactory.register(PanelCardWidget());
    FlowWidgetFactory.register(ListViewWidget());
    FlowWidgetFactory.register(LabelPairListWidget());
    FlowWidgetFactory.register(BackLinkWidget());

    _initialized = true;
  }

  /// Check if widgets are initialized
  static bool get isInitialized => _initialized;

  /// Reset registration (mainly for testing)
  static void reset() {
    _initialized = false;
  }
}
