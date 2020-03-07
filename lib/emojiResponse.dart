import 'dart:math';
import 'package:shake/shake.dart';
import 'package:flutter/material.dart';

class EmojiResponse extends StatefulWidget {
  @override
  _EmojiResponseState createState() => _EmojiResponseState();
}

class _EmojiResponseState extends State<EmojiResponse> {
  void initState() {
    super.initState();
    ShakeDetector detector = ShakeDetector.autoStart(onPhoneShake: () {
      // Do stuff on phone shake
      randomResponse();
    });
    // To close: detector.stopListening();
    // ShakeDetector.waitForStart() waits for user to call detector.startListening();
  }

  String getEmojiByUnicode(int unicode) {
    return new String.fromCharCode(unicode);
  }

  var randomResponses;

  int randomResponse() {
    setState(() {
      randomResponses = [
        0x1F60A,
        0x1F601,
        0x1F914,
        0x1F636,
        0x1F631,
        0x1F44D,
        0x1F44E,
        0x1F614,
        0x1F612,
        0x1F645,
        0x1F646,
        0x1F926,
        0x1F937
      ];
    });

    //ballResponses = findViewById(R.id.responseTextView);
    Random r = new Random();

    //String resp = getEmojiByUnicode(responses[r.nextInt(responses.length)]);

    _responses = getEmojiByUnicode(
        randomResponses[r.nextInt(randomResponses.length)]);

    return _responses as int;
  }

  AlignmentDirectional _alignmentDirectional = AlignmentDirectional.center;

  String _responses = 'Emoji';

  @override
  Widget build(BuildContext context) {



    //String _displayedResponses = _responded();

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
                            onPressed: randomResponse,
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
                            _responses.toString(),
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
