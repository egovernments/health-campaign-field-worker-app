// Import the `EntityModel` class from the `data_model.dart` file.
import '../../../../data_model.dart';

/// The `EntityMapperListener` abstract class serves as a contract for other classes to implement.
/// It provides a standardized way to map entity types to their corresponding entity models.
abstract class EntityMapperListener {

  /// The `getEntityMappers` method is a contract that classes implementing `EntityMapperListener` must fulfill.
  ///
  /// It takes two parameters:
  /// - `entityType`: A string that represents the type of the entity.
  /// - `entityString`: A string representation of the entity itself.
  ///
  /// The method is expected to return an instance of `EntityModel`, which represents a generic entity in the system.
  /// The exact implementation of `getEntityMappers` is not provided in this abstract class. Instead, any class that implements `EntityMapperListener` will provide its own implementation of `getEntityMappers`, tailored to its specific needs.
  EntityModel getEntityMappers(String entityType, String entityString);
}