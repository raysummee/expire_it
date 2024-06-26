## [1.0.0] - 2024-04-28
### Added
- Moved controller initialization from `main` function to `ExpireIt` Widget.
- Removed user accesibility from `ExpireBuilder` which was causing issue and confusion to users
- Added `UserDefineExpireSettings`

## [0.2.0] - 2023-08-30
### Added
- Initialized the `ExpireIt.controller` with a `UserDefineExpireController` instance containing an expiry date of `2022` in the `main()` function.
- Using the `ExpireIt` widget instead of `ExpireBuilder` Widget for better usability and customization.
- Fixed an issue with log messages not displaying color codes properly.

## [0.1.2] - 2023-08-30
### Added
- Added localDateTimeFallback Parameter: Added a parameter localDateTimeFallback to the UserDefineExpireController constructor. When set to true, it allows the controller to fall back to using local device time when the server time is unavailable.

## [0.1.1] - 2023-08-24
### Added
- Example folder rearranged

## [0.1.0] - 2023-08-24
### Added
- Documented and structural changes

## [0.0.3] - 2023-08-21
### Added
- Secure expiration mechanism to prevent unauthorized access after a specified date and time.
- Integration with an online server to fetch expiration information.
- `ExpireBuilder` widget for managing UI based on expiration status.
- Customizable UI elements for expiration dialog and loading indicator.
- Basic documentation providing guidelines for integration and customization.

## [0.0.1] - 2023-08-7
### Added
- Initial release of the ExpireIt Flutter app.


