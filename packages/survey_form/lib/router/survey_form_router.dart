import 'package:auto_route/auto_route.dart';
import 'package:survey_form/router/survey_form_router.gm.dart';


//Used auto_route package to navigate to different pages in survey_form package

@AutoRouterConfig.module()
class SurveyFormRoute extends $SurveyFormRoute {

  RouteType get defaultRouteType => const RouteType.material();

  List<AutoRoute> routes = [
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