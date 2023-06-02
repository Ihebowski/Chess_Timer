import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numberpicker/numberpicker.dart';

//Screen
import 'package:chess_timer/screens/timer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTime = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: const [
                Text(
                  "CHESS",
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  "TIMER",
                  style: TextStyle(
                    fontSize: 80,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Text(
                  "SELECT THE MATCH TIME",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 20),
                NumberPicker(
                  minValue: 5,
                  maxValue: 60,
                  step: 5,
                  value: selectedTime,
                  axis: Axis.horizontal,
                  textStyle: const TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                  selectedTextStyle: const TextStyle(
                    fontSize: 40,
                    color: Colors.amber,
                    fontWeight: FontWeight.bold,
                  ),
                  onChanged: (value) {
                    setState(() {
                      selectedTime = value;
                    });
                  },
                ),
              ],
            ),
            SizedBox(
              width: 140,
              height: 40,
              child: ElevatedButton(
                onPressed: () =>
                    Get.to(const TimerScreen(), arguments: [selectedTime]),
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
                    "OPEN",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
