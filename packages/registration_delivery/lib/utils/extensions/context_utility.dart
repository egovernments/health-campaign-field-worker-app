part of 'extensions.dart';

extension ContextUtilityExtensions on BuildContext {
  int millisecondsSinceEpoch([DateTime? dateTime]) {
    return (dateTime ?? DateTime.now()).millisecondsSinceEpoch;
  }

  void validateStockCount(BuildContext context) async {
    // Trigger ProductVariantLoadEvent
    context.read<ProductVariantBloc>().add(
          ProductVariantLoadEvent(
            query: ProjectResourceSearchModel(
              projectId: [RegistrationDeliverySingleton().projectId!],
            ),
          ),
        );

    // Listen for the Bloc's state changes
    context.read<ProductVariantBloc>().stream.listen((state) async {
      if (state is ProductVariantFetchedState) {
        // Process the fetched product list
        List<String> productList = [];
        state.maybeWhen(
          fetched: (fetched) {
            productList = fetched.map((e) => e.sku!).toList();
          },
          orElse: () {},
        );

        // Ensure productList is not empty before proceeding
        if (productList.isNotEmpty) {
          for (String product in productList) {
            var count = await DeliveryStockCount.instance
                .readStockCount(skuList: [product]);
            if (count.isNotEmpty) {
              if (count.first.values.first > 0) {
                // Show the warning dialog for insufficient stock and stop further checks
                DigitDialog.show(
                  context,
                  options: DigitDialogOptions(
                    titleIcon: Icon(
                      Icons.warning,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    titleText: i18.beneficiaryDetails.insufficientStockHeading,
                    contentText:
                        i18.beneficiaryDetails.insufficientStockMessage,
                    primaryAction: DigitDialogActions(
                      label: i18.common.corecommonclose,
                      action: (dialogContext) {
                        Navigator.of(context, rootNavigator: true).pop();
                        context.router.maybePop();
                      },
                    ),
                  ),
                );
                // Break the loop once a product with insufficient stock is found
                break;
              }
            }
          }
        }
      }
    });
  }

  Future<String> get packageInfo async {
    final info = await PackageInfo.fromPlatform();

    return info.version;
  }

  ProjectCycle? get selectedCycle {
    final selectedCycle = RegistrationDeliverySingleton()
        .projectType
        ?.cycles
        ?.where(
          (e) =>
              (e.startDate) < DateTime.now().millisecondsSinceEpoch &&
              (e.endDate) > DateTime.now().millisecondsSinceEpoch,
          // Return null when no matching cycle is found
        )
        .firstOrNull;

    if (selectedCycle == null) {
      return null;
    }

    return selectedCycle;
  }

  DataRepository<D, R>
      repository<D extends EntityModel, R extends EntitySearchModel>(
    BuildContext context,
  ) {
    switch (RegistrationDeliverySingleton().persistenceConfiguration) {
      case PersistenceConfiguration.offlineFirst:
        return context.read<LocalRepository<D, R>>();
      case PersistenceConfiguration.onlineOnly:
        return context.read<RemoteRepository<D, R>>();
      default:
        return context.read<RemoteRepository<D, R>>();
    }
  }
}
