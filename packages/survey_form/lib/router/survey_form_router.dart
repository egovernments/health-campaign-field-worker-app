import 'package:auto_route/auto_route.dart';
import 'package:survey_form/router/survey_form_router.gr.dart';

export 'package:survey_form/router/survey_form_router.gr.dart';


//Used auto_route package to navigate to different pages in survey_form package

@AutoRouterConfig()
class SurveyFormRoute extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
        page: SurveyFormWrapperRoute.page,
        path: 'surveyForm',
        children: [
          AutoRoute(
          page: SurveyformRoute.page,
          path: '',
      ),
    ],
    ),
    AutoRoute(
        page: SurveyFormBoundaryViewRoute.page, path: 'view-boundary'),
    AutoRoute(page: SurveyFormViewRoute.page, path: 'view'),
    AutoRoute(page: SurveyFormPreviewRoute.page, path: 'preview'),
    AutoRoute(page: SurveyFormAcknowledgementRoute.page, path: 'surveyForm-acknowledgement'),
  ];
}
