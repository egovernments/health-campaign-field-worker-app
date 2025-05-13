import 'package:digit_data_model/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:registration/utils/extensions/extensions.dart';
import 'package:registration/utils/utils.dart';
import 'package:registration/widgets/component_wrapper/selected_project_builder.dart';

class ProductVariantBlocWrapper extends StatelessWidget {
  final Widget child;

  const ProductVariantBlocWrapper({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SelectedProjectBuilder(
      projectBuilder: (context, selectedProject) {
        final productVariant =
            context.repository<ProductVariantModel, ProductVariantSearchModel>(
                context);

        final projectResource = context.repository<ProjectResourceModel,
            ProjectResourceSearchModel>(context);

        return BlocProvider(
          create: (_) => ProductVariantBloc(
            const ProductVariantEmptyState(),
            productVariant,
            projectResource,
          )..add(
              ProductVariantLoadEvent(
                query: ProjectResourceSearchModel(
                  projectId: [RegistrationDeliverySingleton().projectId!],
                ),
              ),
            ),
          lazy: false,
          child: child,
        );
      },
    );
  }
}
