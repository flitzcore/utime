import 'package:flutter/material.dart';
import 'package:utime/home_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(
                      "images/desainwelcomepage.png",
                      width: MediaQuery.of(context).size.width / 1.5,
                    ),
                  ),
                  const Text(
                    "Are you having a tough day?\nIt's ok, take UTime",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w100),
                  ),
                  SizedBox(height: 20),
                  const Text("#YourMentalHealthMatters",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, fontFamily: "Poppins")),
                ],
              ),
              CircleAvatar(
                backgroundColor: Colors.black,
                child: IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    onPressed: () {
                      print("tetx");
                      Navigator.of(context).push(_createRoute());
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(-1, 0);
      const end = Offset.zero;
      const curve = Curves.easeOut;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
