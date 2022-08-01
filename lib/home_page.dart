import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Timer());
  }
}

class Timer extends StatefulWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  final int _duration = 120;
  String _isiText = "hi";

  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    double timerRadius = MediaQuery.of(context).size.height / 2.5;
    return SafeArea(
      child: Center(
        child: Stack(
          children: [
            CircularCountDownTimer(
              duration: _duration,
              fillColor: Color.fromARGB(255, 20, 19, 19),
              ringColor: Color.fromARGB(255, 170, 170, 170),
              height: timerRadius,
              width: timerRadius,
              textFormat: CountdownTextFormat.S,
              strokeWidth: 20.0,
              strokeCap: StrokeCap.round,
              isTimerTextShown: true,
              onChange: (String timeStamp) {
                Future.delayed(Duration.zero, () {
                  setState(() {
                    _isiText = "hi hh $timeStamp";
                  });
                  //your code goes here
                });
              },
            ),
            SizedBox(
                width: timerRadius,
                height: timerRadius,
                child: Center(
                    child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text(
                    _isiText,
                    style: TextStyle(
                        fontSize: timerRadius / 15,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w100),
                    textAlign: TextAlign.center,
                  ),
                )))
          ],
        ),
      ),
    );
  }
}
