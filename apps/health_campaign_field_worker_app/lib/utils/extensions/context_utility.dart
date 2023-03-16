part of 'extensions.dart';

extension ContextUtilityExtensions on BuildContext {
  int millisecondsSinceEpoch([DateTime? dateTime]) {
    return (dateTime ?? DateTime.now()).millisecondsSinceEpoch;
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

  String get projectId {
    final projectBloc = _get<ProjectBloc>();
    final selectedProject = projectBloc.state.whenOrNull(
      fetched: (projects, selectedProject) {
        return selectedProject;
      },
    );

    if (selectedProject == null) {
      throw AppException('Project not selected');
    }

    return selectedProject.id;
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
