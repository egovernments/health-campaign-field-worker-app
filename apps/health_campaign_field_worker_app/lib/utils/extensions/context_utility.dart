part of 'extensions.dart';

extension ContextUtilityExtensions on BuildContext {
  int millisecondsSinceEpoch([DateTime? dateTime]) {
    return (dateTime ?? DateTime.now()).millisecondsSinceEpoch;
  }

  Future<String> get packageInfo async {
    final info = await PackageInfo.fromPlatform();

    return info.version;
  }

  ProjectModel get selectedProject {
    final projectBloc = _get<ProjectBloc>();

    final projectState = projectBloc.state;
    final selectedProject = projectState.selectedProject;

    if (selectedProject == null) {
      throw AppException('No project is selected');
    }

    return selectedProject;
  }

  String get projectId => selectedProject.id;

  Cycle get selectedCycle {
    final projectBloc = _get<ProjectBloc>();

    final projectState = projectBloc.state;
    final selectedCycle = projectState.projectType?.cycles
        ?.where(
          (e) =>
              (e.startDate!) < DateTime.now().millisecondsSinceEpoch &&
              (e.endDate!) > DateTime.now().millisecondsSinceEpoch,
          // Return null when no matching cycle is found
        )
        .firstOrNull;

    if (selectedCycle == null) {
      return const Cycle();
    }

    return selectedCycle;
  }

  ProjectType? get selectedProjectType {
    final projectBloc = _get<ProjectBloc>();

    final projectState = projectBloc.state;
    final projectType = projectState.projectType;

    if (selectedCycle == null) {
      return null;
    }

    return projectType;
  }

  List<String> get cycles {
    final projectBloc = _get<ProjectBloc>();

    final projectState = projectBloc.state;

    if (projectState.projectType?.cycles != null &&
        (projectState.projectType?.cycles?.length ?? 0) > 0) {
      List<String> resultList = [];

      for (int i = 1;
          i <= (projectState.projectType?.cycles?.length ?? 0);
          i++) {
        resultList.add('0${i.toString()}');
      }

      return resultList;
    } else {
      return [];
    }
  }

  BoundaryModel get boundary {
    final boundaryBloc = _get<BoundaryBloc>();
    final boundaryState = boundaryBloc.state;

    final selectedBoundary = boundaryState.selectedBoundaryMap.entries
        .where((element) => element.value != null)
        .lastOrNull
        ?.value;

    if (selectedBoundary == null) {
      throw AppException('No boundary is selected');
    }

    return selectedBoundary;
  }

  BeneficiaryType get beneficiaryType {
    final projectBloc = _get<ProjectBloc>();

    final projectState = projectBloc.state;

    final BeneficiaryType? selectedBeneficiary =
        projectState.selectedProject?.targets?.firstOrNull?.beneficiaryType;

    if (selectedBeneficiary == null) {
      throw AppException('No beneficiary type is selected');
    }

    return selectedBeneficiary;
  }

  BoundaryModel? get boundaryOrNull {
    try {
      return boundary;
    } catch (_) {
      return null;
    }
  }

  List<UserRoleModel> get loggedInUserRoles {
    final authBloc = _get<AuthBloc>();
    final userRequestObject = authBloc.state.whenOrNull(
      authenticated: (accessToken, refreshToken, userModel, actionsWrapper) {
        return userModel.roles;
      },
    );

    if (userRequestObject == null) {
      throw AppException('User not authenticated');
    }

    return userRequestObject;
  }

  String get loggedInUserUuid => loggedInUser.uuid;

  UserRequestModel get loggedInUser {
    final authBloc = _get<AuthBloc>();
    final userRequestObject = authBloc.state.whenOrNull(
      authenticated: (accessToken, refreshToken, userModel, actions) {
        return userModel;
      },
    );

    if (userRequestObject == null) {
      throw AppException('User not authenticated');
    }

    return userRequestObject;
  }

  bool get showProgressBar {
    UserRequestModel loggedInUser;

    try {
      loggedInUser = this.loggedInUser;
    } catch (_) {
      return false;
    }

    for (final role in loggedInUser.roles) {
      switch (role.code) {
        case "REGISTRAR":
        case "DISTRIBUTOR":
          return true;
        default:
          break;
      }
    }

    return false;
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
