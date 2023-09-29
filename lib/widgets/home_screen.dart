import 'package:flutter/material.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static int workTime = 25;
  int totalSeconds = workTime;
  static int round = 2;
  static int goal = 12;
  bool isRunning = false;
  bool isSelected = true;
  bool isBreakTime = false;
  int totalPomodoros = 1;
  int totalGoal = 0;
  late Timer timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      timer.cancel(); // 타이머를 일시적으로 취소
      if (isBreakTime) {
        setState(() {
          isRunning = false; // 휴식 시간 후에 타이머를 정지
          // 라운드를 리셋
          isBreakTime = false; // 휴식 시간 플래그를 해제
          totalSeconds = workTime; // 작업 시간을 초기화
        });
      } else if (totalPomodoros == round) {
        setState(() {
          totalGoal += 1; // 사이클을 완료하면 Goal을 증가
          totalPomodoros = 1;
          totalSeconds = 5; // 5분의 휴식 시간 설정 (이 경우에는 5초로 설정해도 됩니다)
          isBreakTime = true; // 휴식 시간 플래그를 설정
          isRunning = true; // 휴식 시간 동안 타이머를 계속 실행
        });
        startTimer(); // 휴식 시간 동안 타이머를 다시 시작
      } else {
        setState(() {
          totalPomodoros += 1;
          totalSeconds = workTime;
          isRunning = false;
        });
      }
    } else {
      setState(() {
        totalSeconds -= 1; // 1초마다 totalSeconds를 감소
      });
    }
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
  }

  void onStartPressed() {
    setState(() {
      if (!isRunning && !isBreakTime) {
        isRunning = true;
        startTimer();
      }
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      totalSeconds = workTime;
      isRunning = false;
    });
  }

  void updateTimer(int minutes) {
    setState(() {
      workTime = minutes; // Convert minutes to seconds
      totalSeconds = workTime;
      if (isRunning) {
        onPausePressed(); // Pause the timer if it's running
      }
    });
  }

  Widget timeOption(int minutes) {
    int seconds = minutes;
    if (workTime == seconds) {
      isSelected = true;
    } else {
      isSelected = false;
    }
    return GestureDetector(
      onTap: () {
        updateTimer(minutes); // Update timer when the container is tapped
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).colorScheme.background
              : Theme.of(context).cardColor,
          border: Border.all(
              width: 2,
              color: isSelected
                  ? Theme.of(context).cardColor
                  : Theme.of(context).colorScheme.background),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          '$minutes',
          style: TextStyle(
            fontSize: 45,
            fontWeight: FontWeight.w600,
            color: isSelected
                ? Theme.of(context).cardColor
                : Theme.of(context).colorScheme.background,
          ),
        ),
      ),
    );
  }

  String formatMin(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 4);
  }

  String formatSec(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(5, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context)
          .cardColor, //Theme.of(context).colorScheme.background
      body: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          border: Border.all(color: Theme.of(context).cardColor, width: 10),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: [
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  const SizedBox(
                    height: 150,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'POMOTIMER',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Theme.of(context).cardColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(children: <Widget>[
                    Positioned(
                      child: Container(
                        width: 115,
                        height: 150,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Theme.of(context).cardColor,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(12.5, -10),
                                  color: Theme.of(context)
                                      .cardColor
                                      .withOpacity(0.8))
                            ]),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        width: 90,
                        height: 150,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Theme.of(context).cardColor,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(25, -20),
                                  color: Theme.of(context)
                                      .cardColor
                                      .withOpacity(0.6))
                            ]),
                      ),
                    ),
                    Container(
                      height: 150,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        formatMin(totalSeconds),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.background,
                          fontSize: 89,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ]),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      ':',
                      style: TextStyle(
                        color: Theme.of(context).cardColor.withOpacity(0.5),
                        fontSize: 89,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Stack(children: <Widget>[
                    Positioned(
                      child: Container(
                        width: 115,
                        height: 150,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Theme.of(context).cardColor,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(12.5, -10),
                                  color: Theme.of(context)
                                      .cardColor
                                      .withOpacity(0.8))
                            ]),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        width: 90,
                        height: 150,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Theme.of(context).cardColor,
                            boxShadow: [
                              BoxShadow(
                                  offset: const Offset(25, -20),
                                  color: Theme.of(context)
                                      .cardColor
                                      .withOpacity(0.6))
                            ]),
                      ),
                    ),
                    Container(
                      height: 150,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        formatSec(totalSeconds),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.background,
                          fontSize: 89,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ]),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Flexible(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    timeOption(15),
                    const SizedBox(width: 20),
                    timeOption(20),
                    const SizedBox(width: 20),
                    timeOption(25),
                    const SizedBox(width: 20),
                    timeOption(30),
                    const SizedBox(width: 20),
                    timeOption(35),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Flexible(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: IconButton(
                      iconSize: 120,
                      color: Theme.of(context).cardColor,
                      onPressed: isRunning ? onPausePressed : onStartPressed,
                      icon: Icon(isRunning
                          ? Icons.pause_circle_outline
                          : Icons.play_circle_outline),
                    ),
                  ),
                  Center(
                    child: IconButton(
                      iconSize: 50,
                      color: Theme.of(context).cardColor,
                      onPressed: onResetPressed,
                      icon: const Icon(Icons.stop_circle_outlined),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Flexible(
              flex: 1,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ROUND',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .color,
                                ),
                              ),
                              Text(
                                '$totalPomodoros/$round',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .color,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'GOAL',
                                style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w600,
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .color,
                                ),
                              ),
                              Text(
                                '$totalGoal/$goal',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.w400,
                                  color: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .color,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
