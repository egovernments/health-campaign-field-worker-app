import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils.dart';

extension ContextUtilityExtensions on BuildContext {
  int millisecondsSinceEpoch([DateTime? dateTime]) {
    return (dateTime ?? DateTime.now()).millisecondsSinceEpoch;
  }

  // Provides survey_form repository based on the persistence configuration
  DataRepository<D, R>
  repository<D extends EntityModel, R extends EntitySearchModel>(
      BuildContext context,
      ) {
    switch (SurveyFormSingleton().persistenceConfiguration) {
      case PersistenceConfiguration.offlineFirst:
        return context.read<LocalRepository<D, R>>();
      case PersistenceConfiguration.onlineOnly:
        return context.read<RemoteRepository<D, R>>();
      default:
        return context.read<LocalRepository<D, R>>();
    }
  }
}
