import 'package:flutter/material.dart';

class cardTime extends StatelessWidget {
  final String startTimeMin,
      startTimeHour,
      endTimeMin,
      endTimeHour,
      purposeFirst,
      purposeSecond,
      firstName,
      secondName,
      thirdName,
      plusName;
  final Color cardColor;
  final bool isInverted;

  const cardTime({
    super.key,
    required this.startTimeMin,
    required this.startTimeHour,
    required this.endTimeMin,
    required this.endTimeHour,
    required this.purposeFirst,
    required this.purposeSecond,
    required this.firstName,
    required this.secondName,
    required this.thirdName,
    required this.plusName,
    required this.isInverted,
    this.cardColor = const Color.fromARGB(255, 254, 248, 84),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        startTimeHour,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(startTimeMin),
                      Text(
                        '|',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                      Text(
                        endTimeHour,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(endTimeMin),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        purposeFirst,
                        style: const TextStyle(
                            fontSize: 50,
                            height: 1,
                            fontWeight: FontWeight.w500),
                      ),
                      Text(
                        purposeSecond,
                        style: const TextStyle(
                            fontSize: 50,
                            height: 1,
                            fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                  ),
                  Text(
                    firstName,
                    style: TextStyle(
                        color: isInverted
                            ? Colors.black.withOpacity(1.0)
                            : Colors.black.withOpacity(0.5)),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    secondName,
                    style: TextStyle(color: Colors.black.withOpacity(0.5)),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    thirdName,
                    style: TextStyle(color: Colors.black.withOpacity(0.5)),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    plusName,
                    style: TextStyle(
                        color: isInverted
                            ? Colors.black.withOpacity(0.5)
                            : Colors.black.withOpacity(0)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
