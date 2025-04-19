import 'package:flutter/material.dart';
import 'package:laundry_service_app/components/PurchaseMoreScreen.dart';
import 'package:laundry_service_app/utils/LSColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class LSNotificationScreen extends StatefulWidget {
  static String tag = '/LSNotificationScreen';

  @override
  LSNotificationScreenState createState() => LSNotificationScreenState();
}

class LSNotificationScreenState extends State<LSNotificationScreen> {
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
  void dispose() {
    setStatusBarColor(appStore.isDarkModeOn ? context.cardColor : LSColorPrimary);

    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Notification', center: true, color: context.cardColor),
      body: PurchaseMoreScreen(),
    );
  }
}
