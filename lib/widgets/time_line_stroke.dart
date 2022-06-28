import 'package:JudoRegistration/widgets/custom_line.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeLineStroke extends StatelessWidget {
  const TimeLineStroke({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;

    return Container(
                    color: Colors.transparent,
                    width: width / 6,
                    height: height * 3,
                    child: ListView.builder(
                      itemCount: 24,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                              width: double.infinity,
                              height: height / 8,
                              color: Colors.transparent,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: double.infinity,
                                    child: CustomPaint(
                                      foregroundPainter: CustomLinePainter(
                                          color: const Color(0xff8B8B8D),
                                          width: 0.25),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: CustomPaint(
                                      foregroundPainter: CustomLinePainter(
                                          color: const Color(0xff8B8B8D),
                                          width: 0.5),
                                    ),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: CustomPaint(
                                      foregroundPainter: CustomLinePainter(
                                          color: const Color(0xff8B8B8D),
                                          width: 0.25),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: -7.5,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                child: Text(
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                    DateFormat('Hm').format(
                                        DateTime(2020, 1, 1, index + 1, 00))),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  );
  }
}