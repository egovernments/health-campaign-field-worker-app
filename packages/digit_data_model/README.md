# Data Model Package

The `digit_data_model` package is a comprehensive data modeling library for the project. It defines various classes, enums, and functions used throughout the project. The package is written in Dart and is primarily used in Flutter applications.

## Features

- **Data Models**: The package provides a set of predefined data models like `DataModel`, `EntityModel`, `EntitySearchModel`, `AdditionalFields`, `AdditionalField`, `ClientAuditDetails`, `AuditDetails`, etc. These models are used to structure the data in the project.

- **Model Provider**: The package includes a `ModelProvider` abstract class that can be implemented to provide a list of models. It also includes a `ModelProviderRegistry` class to register and retrieve all model providers.

- **Data Model Type Enum**: The package defines a `DataModelType` enum that represents the different types of data models in the project.

- **Mapping Annotations**: The package uses the `dart_mappable` package to generate mapping code for the classes. This helps in converting the data models to and from JSON.

- **Data Repositories**: The package provides abstract classes for data repositories, `DataRepository`, `RemoteRepository`, and `LocalRepository`, which can be extended to create repositories for different data models. It also includes error handling with `InvalidApiResponseException`.

- **Sql Store**: The package includes a `SqlStore` class that can be used to store data in a SQLite database.
  - Here are the key features it provides to other packages:  
      1. Database Connection: It provides a connection to the SQLite database. This connection is opened when the database is first accessed.  
      2. Table Definitions: It defines the tables in the database. These tables correspond to various entities in the project.  
      3. Database Operations: It provides methods for querying and manipulating the data in the tables. These methods can be used to perform CRUD (Create, Read, Update, Delete) operations on the data.  
      4. Schema Version: It provides the schema version of the database. This can be used to handle database migrations.  
      5. Drift Integration: It uses the Drift package for interacting with the SQLite database. This provides a reactive persistence library for Flutter and Dart.

## Getting Started

To use this package, add the following dependency to your `pubspec.yaml` file:

```yaml
dependencies:
  digit_data_model: ^0.0.0-dev.1
```
## Usage

Here are some examples of how to use the DataModel package in your project:

Extend the `LocalRepository` class and implement the required methods.

```dart
    class ExampleLocalRepository
        extends LocalRepository<ExampleExampleModel, ExampleExampleSearchModel> {
    ExampleExamplesLocalRepository(super.sql, super.opLogManager);
    }
```
Extend the `RemoteRepository` class and implement the required methods.

```dart
    class ExampleExamplesRemoteRepository
        extends RemoteRepository<ExampleExampleModel, ExampleExampleSearchModel> {
    ExampleExamplesRemoteRepository(super.apiClient, super.opLogManager);
    }
```

Extend the `DataRepository` class and implement the required methods.

```dart
    class ExampleExampleSearchModel extends EntitySearchModel {
  ExampleSearchModel({
    required this.employeeId,
    required this.attendanceDate,
    required this.status,
  });
}
```
```dart
    class ExampleAdditionalFields extends AdditionalFields {
  ExampleAdditionalFields({
    required this.field1,
    required this.field2,
  });
}
```
