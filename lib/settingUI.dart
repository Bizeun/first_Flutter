import 'package:flutter/material.dart';
import 'package:toonflix/widgets/cardTime.dart';

void msettingUI() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Image(
                              width: 50,
                              image: AssetImage(
                                'assets/images/profile.png',
                              ),
                            ),
                            Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 30,
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tuesday 25',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        //create text widget after finish coding
                        children: [
                          const Text(
                            'TODAY',
                            style: TextStyle(color: Colors.white, fontSize: 50),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.circle,
                            color: Color.fromARGB(255, 254, 91, 79),
                            size: 15,
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            '26',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 40),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            '27',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 40),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            '28',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 40),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            '29',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 40),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Text(
                            '30',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 40),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const cardTime(
                startTimeMin: '30',
                startTimeHour: '11',
                endTimeMin: '20',
                endTimeHour: '12',
                purposeFirst: 'Design',
                purposeSecond: 'Meeting',
                firstName: 'ALEX',
                secondName: 'HELENA',
                thirdName: 'NANA',
                plusName: '+4',
                isInverted: false,
              ),
              const cardTime(
                startTimeMin: '35',
                startTimeHour: '12',
                endTimeMin: '10',
                endTimeHour: '14',
                purposeFirst: 'DAILY',
                purposeSecond: 'PROGECT',
                firstName: 'ME',
                secondName: 'RICHARD',
                thirdName: 'CIRY',
                plusName: '+4',
                isInverted: true,
                cardColor: Color.fromARGB(255, 156, 107, 206),
              ),
              const cardTime(
                startTimeMin: '00',
                startTimeHour: '15',
                endTimeMin: '30',
                endTimeHour: '16',
                purposeFirst: 'WEEKLY',
                purposeSecond: 'PLANNING',
                firstName: 'DEN',
                secondName: 'NANA',
                thirdName: 'MARK',
                plusName: '+4',
                isInverted: false,
                cardColor: Color.fromARGB(255, 189, 238, 75),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
