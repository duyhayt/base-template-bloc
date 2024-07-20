import 'dart:async';
import 'dart:ui';

class Debounce {
  final int milliseconds;
  Timer? _timer;

  Timer? get timer => _timer;

  Debounce({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel();
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
  }
}