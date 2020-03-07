import 'package:flutter/material.dart';
import 'package:firebase_admob/firebase_admob.dart';

import 'package:myapp/options.dart';
import 'package:myapp/basicResponse.dart';
import 'package:myapp/valleyResponse.dart';
import 'package:myapp/emojiResponse.dart';


void main() => runApp(MaterialApp(
  theme: ThemeData(fontFamily: 'SpicyRice'),
    home: Home(),
    routes: {
      '/options': (context) => Options(),
      '/basicResponse': (context) => BasicResponse(),
      '/valleyResponse': (context) => ValleyResponse(),
      '/emojiResponse': (context) => EmojiResponse(),
    }));

class Home extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    FirebaseAdMob.instance.initialize(appId: "ca-app-pub-7511726508597203~5056814937");
    myBanner..load()..show();
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Silly',
                style: TextStyle(fontSize: 58),),
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: FlatButton(
                                onPressed: (){
                                  Navigator.pushNamed(context, '/options');
                                },
                                child: Image.asset('assets/magicball_base.png')),
                          ),
                        ],
                      ),
                    ),
                    Container(

                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            '8',
                            style:
                            TextStyle(fontSize: 120.0, color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Text('Tap to get started',
                style: TextStyle(fontSize: 38),),
              ],
            )),
      ),
    );
  }
}


MobileAdTargetingInfo targetingInfo = MobileAdTargetingInfo(
  keywords: <String>['flutterio', 'beautiful apps'],
  contentUrl: 'https://flutter.io',
  childDirected: false,
 // or MobileAdGender.female, MobileAdGender.unknown
  testDevices: <String>[], // Android emulators are considered test devices
);

BannerAd myBanner = BannerAd(
  // Replace the testAdUnitId with an ad unit id from the AdMob dash.
  // https://developers.google.com/admob/android/test-ads
  // https://developers.google.com/admob/ios/test-ads
  adUnitId: 'ca-app-pub-7511726508597203/5986753223',
  size: AdSize.smartBanner,
  targetingInfo: targetingInfo,
  listener: (MobileAdEvent event) {
    print("BannerAd event is $event");
  },
);