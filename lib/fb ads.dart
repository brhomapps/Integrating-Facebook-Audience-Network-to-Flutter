import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

import 'NextPage.dart';

class FacebookAds extends StatefulWidget {
  @override
  _FacebookAdsState createState() => _FacebookAdsState();
}

class _FacebookAdsState extends State<FacebookAds> {
  bool _isInterstitialAdLoaded = true;

  @override
  void initState() {
    super.initState();
    FacebookAudienceNetwork.init(
      // your test id will be in printed in the console. Paste that onto the testingId parameter //
      testingId: "b9f2908b-1a6b-4a5b-b862-ded7ce289e41",
    );

    _loadInterstitialAd();
  }

  void _loadInterstitialAd() {
    FacebookInterstitialAd.loadInterstitialAd(
      // Add_YOUR_PLACEMENT_ID //
      placementId: "IMG_16_9_APP_INSTALL#299486252083346_299911042040867",
      listener: (result, value) {
        print(">> FAN > Interstitial Ad: $result --> $value");
        if (result == InterstitialAdResult.LOADED)
          _isInterstitialAdLoaded = true;

        /// Once an Interstitial Ad has been dismissed and becomes invalidated,
        /// load a fresh Ad by calling this function.
        if (result == InterstitialAdResult.DISMISSED &&
            value["invalidated"] == true) {
          _isInterstitialAdLoaded = false;
          _loadInterstitialAd();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(children: <Widget>[
            ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with both widgets'),
              trailing: Icon(Icons.favorite_border),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NextPage()));
              },
            ),
            Divider(thickness: 2),
            ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with both widgets'),
              trailing: Icon(Icons.favorite_border),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NextPage()));
              },
            ),
            _nativeAd(),
            Divider(thickness: 2),
            ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with both widgets'),
              trailing: Icon(Icons.favorite_border),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NextPage()));
              },
            ),
            Divider(thickness: 2),
            ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with both widgets'),
              trailing: Icon(Icons.favorite_border),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NextPage()));
              },
            ),
            _nativeAd(),
            Divider(thickness: 2),
            ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with both widgets'),
              trailing: Icon(Icons.favorite_border),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NextPage()));
              },
            ),
            Divider(thickness: 2),
            ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with both widgets'),
              trailing: Icon(Icons.favorite_border),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NextPage()));
              },
            ),
            Divider(thickness: 2),
            ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with both widgets'),
              trailing: Icon(Icons.favorite_border),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NextPage()));
              },
            ),
            _nativeBannerAd(),
            Divider(thickness: 2),
            ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with both widgets'),
              trailing: Icon(Icons.favorite_border),
              onTap: () {
                _showInterstitialAd();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NextPage()));
              },
            ),
          ]),
        ));
  }

  _showInterstitialAd() {
    if (_isInterstitialAdLoaded == true)
      FacebookInterstitialAd.showInterstitialAd();
    else
      print("Interstial Ad not yet loaded!");
  }

  Widget _nativeBannerAd() {
    return FacebookNativeAd(
      // Add_YOUR_PLACEMENT_ID //
      placementId: "IMG_16_9_APP_INSTALL#299486252083346_299911602040811",
      adType: NativeAdType.NATIVE_BANNER_AD,
      bannerAdSize: NativeBannerAdSize.HEIGHT_100,
      width: double.infinity,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      buttonColor: Colors.deepPurple,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      listener: (result, value) {
        print("Native Banner Ad: $result --> $value");
      },
    );
  }

  Widget _nativeAd() {
    return FacebookNativeAd(
      // Add_YOUR_PLACEMENT_ID //
      placementId: "IMG_16_9_APP_INSTALL#299486252083346_299911465374158",
      adType: NativeAdType.NATIVE_AD_VERTICAL,
      bannerAdSize: NativeBannerAdSize.HEIGHT_100,
      width: double.infinity,
      backgroundColor: Colors.blue,
      titleColor: Colors.white,
      descriptionColor: Colors.white,
      buttonColor: Colors.deepPurple,
      buttonTitleColor: Colors.white,
      buttonBorderColor: Colors.white,
      listener: (result, value) {
        print("Native Banner Ad: $result --> $value");
      },
      keepExpandedWhileLoading: true,
      expandAnimationDuraion: 1000,
    );
  }
}
