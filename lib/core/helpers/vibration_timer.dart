import 'dart:async';

import 'package:vibration/vibration.dart';

class VibrationTimer {
  Timer? _timer;

  void run(int replay) {
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: replay), (Timer timer) {
      Vibration.vibrate(
        amplitude: 255
        ); // amplitude: 0-255 là cường độ rung
    });
  }

  void dispose() {
    _timer?.cancel();
    Vibration.cancel();
  }
}
