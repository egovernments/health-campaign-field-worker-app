import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/record_stock/record_stock.dart';
import '../../../data/network_manager.dart';
import '../../../models/data_model.dart';

class RecordStockWrapperPage extends StatelessWidget {
  final StockRecordEntryType type;

  const RecordStockWrapperPage({
    Key? key,
    required this.type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final manager = context.read<NetworkManager>();
    final stockRepository = manager.repository<StockModel, StockSearchModel>(
      context,
    );

    return BlocProvider(
      create: (context) => RecordStockBloc(
        RecordStockCreateState(entryType: type),
        stockRepository: stockRepository,
      ),
      child: const AutoRouter(),
    );
  }
}
