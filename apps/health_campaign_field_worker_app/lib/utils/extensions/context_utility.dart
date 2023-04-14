part of 'extensions.dart';

extension ContextUtilityExtensions on BuildContext {
  int millisecondsSinceEpoch([DateTime? dateTime]) {
    return (dateTime ?? DateTime.now()).millisecondsSinceEpoch;
  }

  String get projectId {
    final projectBloc = _get<ProjectBloc>();

    final projectState = projectBloc.state;

    return projectState.maybeWhen(
      orElse: () {
        throw AppException('Invalid project state');
      },
      fetched: (projects, selectedProject) {
        if (selectedProject == null) {
          throw AppException('No project is selected');
        }

        return selectedProject.id;
      },
    );
  }

  BoundaryModel get boundary {
    final boundaryBloc = _get<BoundaryBloc>();
    final boundaryState = boundaryBloc.state;

    final selectedBoundary = boundaryState.selectedBoundary;
    if (selectedBoundary == null) {
      throw AppException('No boundary is selected');
    }

    // TODO(ajil): Fix this last check
    // return selectedBoundary.where((e) => e != '').toList().last;
    return BoundaryModel(
      code: selectedBoundary.where((e) => e != '').toList().last,
      name: selectedBoundary.where((e) => e != '').toList().last,
    );
  }

  String get loggedInUserUuid {
    final authBloc = _get<AuthBloc>();
    final userRequestObject = authBloc.state.whenOrNull(
      authenticated: (accessToken, refreshToken, userModel) {
        return userModel;
      },
    );

    if (userRequestObject == null) {
      throw AppException('User not authenticated');
    }

    return userRequestObject.uuid;
  }

  UserRequestModel get loggedInUser {
    final authBloc = _get<AuthBloc>();
    final userRequestObject = authBloc.state.whenOrNull(
      authenticated: (accessToken, refreshToken, userModel) {
        return userModel;
      },
    );

    if (userRequestObject == null) {
      throw AppException('User not authenticated');
    }

    return userRequestObject;
  }

  NetworkManager get networkManager => read<NetworkManager>();

  DataRepository<D, R>
      repository<D extends EntityModel, R extends EntitySearchModel>() =>
          networkManager.repository<D, R>(this);

  T _get<T extends BlocBase>() {
    try {
      final bloc = read<T>();

      return bloc;
    } on ProviderNotFoundException catch (_) {
      throw AppException(
        '${T.runtimeType} not found in the current context',
      );
    } catch (error) {
      throw AppException('Could not fetch ${T.runtimeType}');
    }
  }
}
