import 'package:get/get.dart';
import 'dart:async';

class TimerController extends GetxController {
  Timer? whiteTimer, blackTimer;
  final gameOn = false.obs;

  final whiteMinutes = 0.obs, blackMinutes = 0.obs;
  final whiteSeconds = 0.obs, blackSeconds = 0.obs;

  final whiteTurn = true.obs, blackTurn = false.obs;

  final whiteLost = false.obs, blackLost = false.obs;

  final whiteResign = false.obs, blackResign = false.obs;

  void whiteStartTimer() {
    whiteTimer = Timer.periodic(const Duration(seconds: 1), (x) {
      if (whiteMinutes.value > 0) {
        if (whiteSeconds.value == 0) {
          whiteMinutes.value--;
          whiteSeconds.value = 59;
        } else if (whiteSeconds.value > 0) {
          whiteSeconds.value--;
        }
      } else if (whiteSeconds.value > 0) {
        whiteSeconds.value--;
      } else {
        x.cancel();
        whiteLost.value = true;
        gameOn.value = false;
      }
    });
  }

  void blackStartTimer() {
    blackTimer = Timer.periodic(const Duration(seconds: 1), (x) {
      if (blackMinutes.value > 0) {
        if (blackSeconds.value == 0) {
          blackMinutes.value--;
          blackSeconds.value = 59;
        } else if (blackSeconds.value > 0) {
          blackSeconds.value--;
        }
      } else if (blackSeconds.value > 0) {
        blackSeconds.value--;
      } else {
        x.cancel();
        blackLost.value = true;
        gameOn.value = false;
      }
    });
  }

  void whitePauseTimer() {
    whiteTimer?.cancel();
  }

  void blackPauseTimer() {
    blackTimer?.cancel();
  }
}
