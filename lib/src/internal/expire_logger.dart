import 'dart:developer';

/// A utility class for logging information and errors related to the ExpireIt functionality.
///
/// The [ExpireLogger] class provides methods to log informational and error messages in a consistent
/// format using the debugPrint function. It enhances readability of log messages by applying color
/// codes to differentiate between information and error logs.
class ExpireLogger {
  const ExpireLogger._();

  /// Logs an informational message.
  ///
  /// This method logs the provided [message] as an informational message, applying color codes for
  /// improved visibility. The message is formatted as "[INFO]: message".
  ///
  /// Returns the original [message] for convenience.
  static String info(String message) {
    log("\x1B[33m[INFO]: $message\x1B[0m", name: "Expire It");
    return message;
  }

  /// Logs an error message.
  ///
  /// This method logs the provided [message] as an error message, applying color codes for
  /// highlighting. The message is formatted as "[Error]: message".
  ///
  /// Returns the original [message] for convenience.
  static String error(String message) {
    log("\x1B[31m[Error]: $message\x1B[0m", name: "Expire It", level: 2000);
    return message;
  }
}
