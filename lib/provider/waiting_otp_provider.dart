import 'dart:async';

import 'package:flutter/cupertino.dart';

class WaittingOTPProvider extends ChangeNotifier {
  Timer timer;
  int start = 60;
  bool isTimerStart = false;

  void startTimer() {
    isTimerStart = true;
    const oneSec = const Duration(seconds: 1);
    if (timer == null) {
      timer = new Timer.periodic(oneSec, (timer) {
        if (start == 1) {
          timer.cancel();
          start = 0;
        } else {
          start -= 1;
        }
        notifyListeners();
      });
    }
  }

  void stopTimer() {
    if (timer != null) {
      timer.cancel();
    }
  }
}
