/// Represents the possible states of expiration in the ExpireIt functionality.
enum ExpireState {
  /// The expiration state is unaware, indicating that the system has no knowledge of the expiration status.
  unaware,

  /// The expiration has occurred, indicating that the entity being managed has reached its expiration.
  expired,

  /// The expiration is in progress, indicating that the entity is currently active and not yet expired.
  running
}
