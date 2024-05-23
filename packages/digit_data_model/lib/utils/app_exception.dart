/// `AppException` is a custom exception class that implements the `Exception` interface.
/// It can be used throughout the application to throw custom exceptions.
///
/// The class constructor accepts an optional message of type `String`.
/// This message can be used to provide more details about the exception.
class AppException implements Exception {
  /// Creates a new instance of `AppException`.
  ///
  /// The [message] parameter can be used to provide a custom message that describes the exception.
  /// It is optional and can be null.
  AppException([String? message]);
}