import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:utime/model/exercise.dart';
import 'package:utime/model/quotes_list.dart';

bool closeTopContainer = false;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.6;
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: size.width,
            alignment: Alignment.topCenter,
            height: closeTopContainer ? 0 : categoryHeight,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Hi there,',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: "Poppins",
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Rough day huh? Sit down and relax for a bit',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Timer(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Some of these exercise can help you to relax :",
                  style: TextStyle(
                      fontFamily: "Poppins", fontWeight: FontWeight.w100),
                ),
              ],
            ),
          ),
          ListExercise()
        ],
      ),
    ));
  }
}

class ListExercise extends StatefulWidget {
  const ListExercise({Key? key}) : super(key: key);

  @override
  State<ListExercise> createState() => _ListExerciseState();
}

class _ListExerciseState extends State<ListExercise> {
  ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      double value = controller.offset / 119;

      setState(() {
        //  topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        child: ListView.builder(
          itemBuilder: (context, index) {
            final Exercise exercise = exerciseList[index];
            //child:
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: InkWell(
                onTap: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) {
                  //return DetailScreen(place: place);
                  // }));
                },
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Hero(
                                tag: "image_${exercise.name}",
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image.asset(exercise.imageAsset))),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    Text(
                                      exercise.name,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text("data")
                                  ],
                                )),
                          )
                        ])),
              ),
            );
          },
          itemCount: exerciseList.length,
        ),
      ),
    );
  }
}

class Timer extends StatefulWidget {
  const Timer({Key? key}) : super(key: key);

  @override
  State<Timer> createState() => _TimerState();
}

class _TimerState extends State<Timer> {
  final int _duration = 11;
  String _isiText = generateQuotes();

  @override
  Widget build(BuildContext context) {
    double timerRadius = MediaQuery.of(context).size.height / 3;
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
                  int A = int.parse(timeStamp);
                  // String isi = generateQuotes();
                  if (A % 5 == 0) {
                    Future.delayed(Duration.zero, () {
                      setState(() {
                        _isiText = generateQuotes();
                        // print("generate");
                      });
                    });
                  }
                },
                onComplete: () {
                  Future.delayed(Duration.zero, () {
                    setState(() {
                      _isiText = "Feel better yet?";
                    });
                  });
                }),
            SizedBox(
                width: timerRadius,
                height: timerRadius,
                child: Center(
                    child: Container(
                  width: timerRadius * 0.6,
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
