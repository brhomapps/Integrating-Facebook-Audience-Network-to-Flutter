import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';
import 'fb ads.dart';

void main() => runApp(AdExampleApp());

class AdExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        buttonTheme: ButtonThemeData(
          textTheme: ButtonTextTheme.primary,
          buttonColor: Colors.blue,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "fb_ads_flutter_sdk_12 nullsafety",
          ),
        ),
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    FacebookAudienceNetwork.init(
      // your test id will be in printed in the console. Paste that onto the testingId parameter //
      testingId: "b9f2908b-1a6b-4a5b-b862-ded7ce289e41",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: Align(
              alignment: Alignment(0, -1.0),
              child: Padding(
                padding: EdgeInsets.all(16),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => FacebookAds()));
                  },
                  child: Text('NativeBanner'),
                ),
                // child: _getAllButtons(),
              ),
            ),
            fit: FlexFit.tight,
            flex: 2,
          ),
          BottomAppBar(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: FacebookBannerAd(
                // Add_YOUR_PLACEMENT_ID //
                placementId:
                    "IMG_16_9_APP_INSTALL#2312433698835503_2964944860251047",
                bannerSize: BannerSize.STANDARD,
                listener: (result, value) {
                  print("Banner Ad: $result -->  $value");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
