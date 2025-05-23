import 'package:flutter/material.dart';
import 'package:laundry_service_app/components/PurchaseMoreScreen.dart';
import 'package:laundry_service_app/main.dart';
import 'package:laundry_service_app/utils/LSContstants.dart';
import 'package:nb_utils/nb_utils.dart';

import '../screens/LSReferScreen.dart';
import '../utils/LSColors.dart';
import '../utils/LSImages.dart';
import '../utils/LSWidgets.dart';

class LSProfileFragment extends StatefulWidget {
  static String tag = '/LSProfileFragment';

  @override
  LSProfileFragmentState createState() => LSProfileFragmentState();
}

class LSProfileFragmentState extends State<LSProfileFragment> {
  bool isNotification = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await 2.microseconds.delay;
    setStatusBarColor(Colors.transparent);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                commonCacheImageWidget(LSProfileBg, 220, width: context.width(), fit: BoxFit.cover),
                Container(
                  height: 220,
                  width: context.width(),
                  color: black.withOpacity(0.65),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      padding: EdgeInsets.all(3),
                      decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(50)),
                      child: commonCacheImageWidget(LSProfile, 100, width: 100, fit: BoxFit.cover).cornerRadiusWithClipRRect(50),
                    ),
                    16.width,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Analyrs Johansson', style: boldTextStyle(size: 18, color: white)),
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
                      ],
                    ),
                  ],
                ).paddingOnly(left: 16, right: 16)

              ],
            ),
            8.height,
            Container(
              width: context.width(),
              decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
              margin: EdgeInsets.all(8),
              child: Column(
                children: [
                  SettingItemWidget(
                      title: 'Account Info',
                      leading: Icon(LineIcons.info),
                      padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
                      decoration: boxDecorationWithShadow(borderRadius: BorderRadius.circular(8), backgroundColor: context.cardColor),
                      onTap: () {
                        //
                      }),
                  SettingItemWidget(
                      title: 'My Address',
                      leading: Icon(LineIcons.map_pin),
                      padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
                      decoration: boxDecorationWithShadow(borderRadius: BorderRadius.circular(8), backgroundColor: context.cardColor),
                      onTap: () {
                        //
                      }),
                  SettingItemWidget(
                      title: 'Change Password',
                      leading: Icon(LineIcons.key),
                      padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
                      decoration: boxDecorationWithShadow(borderRadius: BorderRadius.circular(8), backgroundColor: context.cardColor),
                      onTap: () {
                      }),
                ],
              ),
            ),
            Text('Other', style: secondaryTextStyle()).paddingAll(16),
            Container(
              width: context.width(),
              decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
              margin: EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      appStore.isDarkModeOn ? Icon(Icons.brightness_2) : Icon(Icons.wb_sunny_rounded),
                      16.width,
                      Text('Choose App Theme', style: boldTextStyle()).expand(),
                      Switch(
                        value: appStore.isDarkModeOn,
                        activeColor: LSColorPrimary,
                        activeTrackColor: LSColorSecondary,
                        onChanged: (val) async {
                          appStore.toggleDarkMode(value: val);
                          await setValue(isDarkModeOnPref, val);
                        },
                      ),
                    ],
                  ).paddingOnly(left: 16, top: 8, right: 16, bottom: 8).onTap(() async {
                    if (getBoolAsync(isDarkModeOnPref)) {
                      appStore.toggleDarkMode(value: false);
                      await setValue(isDarkModeOnPref, false);
                    } else {
                      appStore.toggleDarkMode(value: true);
                      await setValue(isDarkModeOnPref, true);
                    }
                  }),
                  SettingItemWidget(
                      title: 'Report & Feedback',
                      leading: Icon(LineIcons.info),
                      padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
                      decoration: boxDecorationWithShadow(borderRadius: BorderRadius.circular(8), backgroundColor: context.cardColor),
                      onTap: () {
                        //
                      }),
                  SettingItemWidget(
                      title: 'Refer & Earn',
                      leading: Icon(LineIcons.map_pin),
                      padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
                      decoration: boxDecorationWithShadow(borderRadius: BorderRadius.circular(8), backgroundColor: context.cardColor),
                      onTap: () {
                        LSReferScreen().launch(context);
                      }),
                  SettingItemWidget(
                      title: 'App Notification',
                      leading: Icon(LineIcons.key),
                      trailing: Switch(
                        value: isNotification,
                        activeColor: LSColorPrimary,
                        activeTrackColor: LSColorSecondary,
                        onChanged: (v) {
                          isNotification = !isNotification;
                          setState(() {});
                        },
                      ),
                      padding: EdgeInsets.only(left: 16, right: 16, top: 4, bottom: 4),
                      decoration: boxDecorationWithShadow(borderRadius: BorderRadius.circular(8), backgroundColor: context.cardColor),
                      onTap: () {
                        //
                      }),
                  SettingItemWidget(
                      title: 'Settings',
                      leading: Icon(Icons.settings),
                      padding: EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
                      decoration: boxDecorationWithShadow(borderRadius: BorderRadius.circular(8), backgroundColor: context.cardColor),
                      onTap: () {
                        //
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
