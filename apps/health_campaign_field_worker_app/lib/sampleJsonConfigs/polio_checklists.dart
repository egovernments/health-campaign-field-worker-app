import 'polio_inside_household_monitoring.dart';
import 'polio_outside_house_monitoring.dart';
import 'polio_team_supervision.dart';
import 'polio_consumption_monitoring.dart';
import 'polio_preparedness_validation.dart';
import 'polio_form_a_vaccines.dart';

final dynamic samplePolioChecklistsFlows = {
  "name": "POLIO_CHECKLISTS",
  "initialPage": "polioChecklistsMenu",
  "project": "POLIO-SIA",
  "version": 1,
  "disabled": false,
  "isSelected": true,
  "flows": [
    // TEMPLATE menu page with 6 menu_cards
    {
      "screenType": "TEMPLATE",
      "name": "polioChecklistsMenu",
      "heading": "Polio Checklists",
      "header": [
        {
          "format": "backLink",
          "label": "Back",
          "onAction": [
            {
              "actionType": "BACK_NAVIGATION",
              "properties": {"name": "HOME", "type": "HOME"}
            }
          ]
        }
      ],
      "footer": [],
      "initActions": [],
      "body": [
        {
          "format": "menu_card",
          "heading": "Inside Household Monitoring",
          "description": "Monitor vaccination within households",
          "icon": "HomeWork",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "insideHouseholdEntry"
              }
            }
          ]
        },
        {
          "format": "menu_card",
          "heading": "Outside House Monitoring",
          "description": "Monitor vaccination at outdoor sites",
          "icon": "Store",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "outsideHouseEntry"
              }
            }
          ]
        },
        {
          "format": "menu_card",
          "heading": "Team Supervision",
          "description": "Supervise vaccination team activities",
          "icon": "SupervisorAccount",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "teamSupervisionEntry"
              }
            }
          ]
        },
        {
          "format": "menu_card",
          "heading": "Consumption Monitoring",
          "description": "Track vaccine stock and consumption",
          "icon": "Assessment",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "consumptionMonitoringEntry"
              }
            }
          ]
        },
        {
          "format": "menu_card",
          "heading": "Preparedness Validation",
          "description": "Validate campaign preparedness status",
          "icon": "FactCheck",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "preparednessValidationEntry"
              }
            }
          ]
        },
        {
          "format": "menu_card",
          "heading": "Form A Vaccines",
          "description": "Record Form A vaccine stock data",
          "icon": "MedicalServices",
          "onAction": [
            {
              "actionType": "NAVIGATION",
              "properties": {
                "type": "FORM",
                "name": "formAVaccinesEntry"
              }
            }
          ]
        },
      ]
    },
    // Spread all FORM + success TEMPLATE screens from existing configs
    ...(samplePolioInsideHouseholdMonitoringFlows['flows'] as List),
    ...(samplePolioOutsideHouseMonitoringFlows['flows'] as List),
    ...(samplePolioTeamSupervisionFlows['flows'] as List),
    ...(samplePolioConsumptionMonitoringFlows['flows'] as List),
    ...(samplePolioPreparednessValidationFlows['flows'] as List),
    ...(samplePolioFormAVaccinesFlows['flows'] as List),
  ]
};
