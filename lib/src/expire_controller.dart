part of expire_it;

class ExpireController {
  static final ExpireController _instance = ExpireController._();
  static ExpireController get instance => _instance;
  ExpireController._();

  void init(DateTime expiryDate, {bool disable = false}) {
    if (disable) return;
    _expireState.value = ExpireState.unaware;
    _runExpireLoop(expiryDate);
  }

  Timer? _timer;

  final ValueNotifier<ExpireState> _expireState =
      ValueNotifier<ExpireState>(ExpireState.running);

  void _runExpireLoop(DateTime expiryDate) {
    _checkExpired(expiryDate);
    _timer = Timer.periodic(const Duration(minutes: 10), (timer) {
      _checkExpired(expiryDate);
    });
  }

  Future<void> _checkExpired(DateTime expiryDate) async {
    try {
      DateTime serverTime = await NTP.now();
      final isExpired = serverTime.isAfter(expiryDate);
      _setExpire(isExpired);
    } catch (err) {
      log(
        "Check Expired: Server time not available. Using local time",
        name: "Expire It",
      );
      final isExpired = DateTime.now().isAfter(expiryDate);
      _setExpire(isExpired);
    }
  }

  void _setExpire(bool isExpired) {
    if (isExpired) {
      _expireState.value = ExpireState.expired;
    } else {
      _expireState.value = ExpireState.running;
    }
  }

  dispose() {
    _expireState.dispose();
    _timer?.cancel();
  }
}
