import 'package:chess_timer/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

//Controllers
import '../logic/timer_controller.dart';

//Widgets
import 'package:chess_timer/widgets/time.dart';
import 'package:chess_timer/widgets/turn.dart';
import 'package:chess_timer/widgets/resign.dart';
import 'package:chess_timer/widgets/lose.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TimerController timerController = Get.put(TimerController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: GestureDetector(
              onTap: () {
                if (timerController.gameOn.value) {
                  if (timerController.whiteTurn.value) {
                    timerController.whiteTurn.value = false;
                    timerController.blackTurn.value = true;
                    timerController.whitePauseTimer();
                    timerController.blackStartTimer();
                  }
                }
              },
              onLongPress: () {
                if (timerController.gameOn.value &&
                    !timerController.whiteLost.value) {
                  timerController.whitePauseTimer();
                  timerController.blackPauseTimer();
                  timerController.gameOn.value = false;
                  timerController.whiteResign.value = true;
                }
              },
              child: Container(
                height: (MediaQuery.of(context).size.height) / 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Transform.rotate(
                  angle: 180 * math.pi / 180,
                  child: Obx(
                    (() => TimeWidget(
                          color: Colors.black,
                          minutesLeft: timerController.whiteMinutes.value,
                          secondsLeft: timerController.whiteSeconds.value,
                        )),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: GestureDetector(
              onTap: () {
                if (timerController.gameOn.value) {
                  if (timerController.blackTurn.value) {
                    timerController.whiteTurn.value = true;
                    timerController.blackTurn.value = false;
                    timerController.blackPauseTimer();
                    timerController.whiteStartTimer();
                  }
                }
              },
              onLongPress: () {
                if (timerController.gameOn.value &&
                    !timerController.blackLost.value) {
                  timerController.whitePauseTimer();
                  timerController.blackPauseTimer();
                  timerController.gameOn.value = false;
                  timerController.blackResign.value = true;
                }
              },
              child: Container(
                height: (MediaQuery.of(context).size.height) / 2,
                width: MediaQuery.of(context).size.width,
                color: Colors.black,
                child: Obx(
                  (() => TimeWidget(
                        color: Colors.white,
                        minutesLeft: timerController.blackMinutes.value,
                        secondsLeft: timerController.blackSeconds.value,
                      )),
                ),
              ),
            ),
          ),
          Obx(() {
            if (timerController.gameOn.value) {
              if (timerController.whiteTurn.value) {
                return Positioned(
                  top: 40,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Transform.rotate(
                        angle: 180 * math.pi / 180,
                        child: const TurnWidget(
                          color: Colors.black,
                          whoTurn: true,
                        ),
                      ),
                    ),
                  ),
                );
              }
              if (timerController.blackTurn.value) {
                return Positioned(
                  bottom: 40,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Center(
                      child: TurnWidget(
                        color: Colors.white,
                        whoTurn: false,
                      ),
                    ),
                  ),
                );
              }
            }
            return Container();
          }),
          Obx(() {
            if (timerController.whiteResign.value) {
              return Positioned(
                top: 40,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Transform.rotate(
                      angle: 180 * math.pi / 180,
                      child: const ResignWidget(
                        color: Colors.black,
                        whoResign: true,
                      ),
                    ),
                  ),
                ),
              );
            }
            if (timerController.blackResign.value) {
              return Positioned(
                bottom: 40,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: ResignWidget(
                      color: Colors.white,
                      whoResign: false,
                    ),
                  ),
                ),
              );
            }
            return Container();
          }),
          Obx(() {
            if (timerController.whiteLost.value) {
              return Positioned(
                top: 40,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Transform.rotate(
                      angle: 180 * math.pi / 180,
                      child: const LostWidget(
                        color: Colors.black,
                        whoLost: true,
                      ),
                    ),
                  ),
                ),
              );
            }
            if (timerController.blackLost.value) {
              return Positioned(
                bottom: 40,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: LostWidget(
                      color: Colors.white,
                      whoLost: false,
                    ),
                  ),
                ),
              );
            }
            return Container();
          }),
          Obx(() {
            if (!timerController.gameOn.value) {
              return Positioned(
                top: (MediaQuery.of(context).size.height / 2) - 20,
                left: (MediaQuery.of(context).size.width / 2) - 70,
                child: SizedBox(
                  width: 140,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      timerController.gameOn.value = true;

                      timerController.whiteMinutes.value = Get.arguments[0];
                      timerController.blackMinutes.value = Get.arguments[0];
                      timerController.whiteSeconds.value = 0;
                      timerController.blackSeconds.value = 0;

                      timerController.whiteTurn.value = true;
                      timerController.blackTurn.value = false;

                      timerController.whiteLost.value = false;
                      timerController.blackLost.value = false;

                      timerController.whiteResign.value = false;
                      timerController.blackResign.value = false;

                      timerController.whiteStartTimer();
                    },
                    onLongPress: () {
                      Get.off(const HomeScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Text(
                        "START",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
            return Container();
          }),
        ],
      ),
    );
  }
}
