import 'package:flutter/material.dart';
import 'package:laundry_service_app/utils/LSColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../components/LSSOfferPackageComponent.dart';
import '../components/LSServiceNearByComponent.dart';
import '../components/LSTopServiceComponent.dart';
import '../main.dart';
import '../screens/LSNearByScreen.dart';
import '../screens/LSNotificationScreen.dart';
import '../screens/LSOfferAllScreen.dart';

class LSHomeFragment extends StatefulWidget {
  static String tag = '/LSHomeFragment';

  @override
  LSHomeFragmentState createState() => LSHomeFragmentState();
}

class LSHomeFragmentState extends State<LSHomeFragment> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await 2.microseconds.delay;
    setStatusBarColor(appStore.isDarkModeOn ? context.cardColor : LSColorPrimary);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 230,
            floating: true,
            forceElevated: innerBoxIsScrolled,
            pinned: true,
            automaticallyImplyLeading: false,
            titleSpacing: 0,
            backgroundColor: appStore.isDarkModeOn ? context.cardColor : LSColorPrimary,
            actionsIconTheme: IconThemeData(opacity: 0.0),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hello, Jhon', style: boldTextStyle(color: white, size: 20)).paddingOnly(left: 16, right: 16, bottom: 8),
                IconButton(
                    onPressed: () {
                      LSNotificationScreen().launch(context);
                    },
                    icon: Icon(Icons.notifications, color: white))
              ],
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  20.height,
                  Text('Your Location', style: primaryTextStyle(color: white, size: 12)).paddingOnly(left: 16, right: 16, top: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.location_on, color: white, size: 16).paddingRight(4),
                            ),
                            TextSpan(text: 'San Francisco', style: primaryTextStyle(color: white)),
                          ],
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(Icons.airplanemode_on_outlined, color: white, size: 16).paddingRight(4),
                            ),
                            TextSpan(text: 'Change', style: primaryTextStyle(color: white)),
                          ],
                        ),
                      ),
                    ],
                  ).paddingAll(16),
                  Container(
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: context.scaffoldBackgroundColor),
                    alignment: Alignment.center,
                    child: AppTextField(
                      textFieldType: TextFieldType.NAME,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        fillColor: white,
                        hintText: 'Search Laundry shop by name...',
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.search, color: grey),
                        contentPadding: EdgeInsets.only(left: 24.0, bottom: 8.0, top: 8.0, right: 24.0),
                      ),
                    ),
                  ),
                ],
              ).paddingTop(70),
            ),
          )
        ];
      },
      body: Container(
        color: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : LSColorSecondary.withOpacity(0.55),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              8.height,
              Text('Top Services', style: boldTextStyle(size: 18)).paddingOnly(left: 16, top: 16, right: 16, bottom: 8),
              LSTopServiceComponent(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Popular Laundry Nearby', style: boldTextStyle(size: 18)).expand(),
                  TextButton(
                      onPressed: () {
                        LSNearByScreen().launch(context);
                      },
                      child: Text('View All', style: secondaryTextStyle()))
                ],
              ).paddingOnly(left: 16, top: 16, right: 16),
              LSServiceNearByComponent(),
              Row(
                children: [
                  Text('Special Package & Offers', style: boldTextStyle(size: 18)).expand(),
                  TextButton(
                      onPressed: () {
                        LSOfferAllScreen().launch(context);
                      },
                      child: Text('View All', style: secondaryTextStyle()))
                ],
              ).paddingOnly(left: 16, right: 16),
              LSSOfferPackageComponent(),
            ],
          ),
        ),
      ),
    );
  }
}
