import 'package:facebook_audience_network/ad/ad_rewarded.dart';
import 'package:facebook_audience_network/facebook_audience_network.dart';
import 'package:flutter/material.dart';

class NextPage extends StatefulWidget {
  NextPage({Key? key}) : super(key: key);

  @override
  _NextPageState createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  bool _isRewardedAdLoaded = true;

  @override
  void initState() {
    super.initState();
    FacebookAudienceNetwork.init(
      // your test id will be in printed in the console. Paste that onto the testingId parameter //
      testingId: "b9f2908b-1a6b-4a5b-b862-ded7ce289e41",
    );

    _loadRewardedVideoAd();
  }

  void _loadRewardedVideoAd() {
    FacebookRewardedVideoAd.loadRewardedVideoAd(
      // Add_YOUR_PLACEMENT_ID //
      placementId: "VID_HD_9_16_39S_LINK#299486252083346_299911308707507",
      listener: (result, value) {
        print("Rewarded Ad: $result --> $value");
        if (result == RewardedVideoAdResult.LOADED) _isRewardedAdLoaded = true;
        if (result == RewardedVideoAdResult.VIDEO_COMPLETE) if (result ==
                RewardedVideoAdResult.VIDEO_CLOSED &&
            (value == true || value["invalidated"] == true)) {
          _isRewardedAdLoaded = false;
          _loadRewardedVideoAd();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          child: ElevatedButton(
            onPressed: () {
              _showRewardedAd();
            },
            child: Text('Welcome every body'),
          ),
        ),
      ),
    );
  }

  _showRewardedAd() {
    if (_isRewardedAdLoaded == true)
      FacebookRewardedVideoAd.showRewardedVideoAd();
    else
      print("Rewarded Ad not yet loaded!");
  }
}
