import 'package:flutter/material.dart';
import 'package:laundry_service_app/components/PurchaseMoreScreen.dart';
import 'package:nb_utils/nb_utils.dart';

import '../utils/LSColors.dart';

class LSNearByFragment extends StatefulWidget {
  static String tag = '/LSNearByFragment';

  @override
  LSNearByFragmentState createState() => LSNearByFragmentState();
}

class LSNearByFragmentState extends State<LSNearByFragment> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await 2.microseconds.delay;
    setStatusBarColor(context.cardColor);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'NearBy Laundries',
        showBack: false,
        center: true,
        color: context.cardColor,
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: context.iconColor),
            onPressed: () {
              //
            },
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: Container(
            padding: EdgeInsets.all(16),
            decoration: boxDecorationWithShadow(backgroundColor: context.cardColor),
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.location_on, color: LSColorPrimary, size: 16).paddingRight(4),
                      ),
                      TextSpan(text: 'San Francisco', style: primaryTextStyle()),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        child: Icon(Icons.airplanemode_on, color: LSColorPrimary, size: 16).paddingRight(4),
                      ),
                      TextSpan(text: 'Change', style: primaryTextStyle(color: LSColorPrimary)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: PurchaseMoreScreen(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: LSColorPrimary,
        onPressed: () {
          //
        },
        child: Icon(Icons.location_on, color: white),
      ),
    );
  }
}
