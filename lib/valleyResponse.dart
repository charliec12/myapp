import 'dart:math';
import 'package:shake/shake.dart';
import 'package:flutter/material.dart';

class ValleyResponse extends StatefulWidget {

  @override
  _ValleyResponseState createState() => _ValleyResponseState();
}

class _ValleyResponseState extends State<ValleyResponse> {

  var randomResponses;

  String _responded() {
    String randomResponse() {
      setState(() {
        randomResponses = [
          "Yes! Live your\n best life sis",
          "No, As if!",
          "Maybe in \nanother Life",
          "Absolutely",
          "Slay it sis",
          "its ok",
          "Try again",
          "very likely",
          "Of Course, duh",
          "Like don't even\n think about it",
          "i can't even",
          "HMM, let me \nthink about it"
        ];
      });

      //ballResponses = findViewById(R.id.responseTextView);
      Random r = new Random();

      String _responses = randomResponses[r.nextInt(randomResponses.length)];

      return _responses;
    }

    return _responses = randomResponse();

  }

  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      // Do stuff on phone shake
      _responded();
    });
    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }

  AlignmentDirectional _alignmentDirectional = AlignmentDirectional.center;

  String _responses = 'Valley';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Asks me a yes or no question',
              style: TextStyle(fontSize: 38, ),textAlign: TextAlign.center,),
            Stack(
              alignment: _alignmentDirectional,
              children: <Widget>[
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        child: FlatButton(
                            onPressed: _responded,
                            child: Image.asset('assets/magicball_base.png')),
                      ),
                    ],
                  ),
                ),
                Container(
                  //color: Colors.deepPurpleAccent,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: 150.0,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            _responses,
                            style: TextStyle(fontSize: 55, color: Colors.white),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text('Tap or shake for response',style: TextStyle(fontSize: 38, ),textAlign: TextAlign.center,),
          ],
        )),
      ),
    );
  }
}
