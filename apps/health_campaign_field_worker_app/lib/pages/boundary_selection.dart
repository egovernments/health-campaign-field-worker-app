import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/boundary/boundary.dart';

class BoundarySelectionPage extends StatelessWidget {
  const BoundarySelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BoundaryBloc, BoundaryState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: state.boundaryList.length,
            itemBuilder: (context, index) {
              final boundary = state.boundaryList[index];

              return ListTile(
                title: Text(boundary.code ?? ''),
              );
            },
          );
        },
      ),
    );
  }
}
