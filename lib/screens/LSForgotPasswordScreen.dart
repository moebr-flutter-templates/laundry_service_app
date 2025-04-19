import 'package:flutter/material.dart';
import 'package:laundry_service_app/screens/LSOtpScreen.dart';
import 'package:laundry_service_app/utils/LSColors.dart';
import 'package:laundry_service_app/utils/LSImages.dart';
import 'package:laundry_service_app/utils/LSWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

import '../main.dart';

class LSForgotPasswordScreen extends StatefulWidget {
  static String tag = '/LSForgotPasswordScreen';

  @override
  LSForgotPasswordScreenState createState() => LSForgotPasswordScreenState();
}

class LSForgotPasswordScreenState extends State<LSForgotPasswordScreen> {
  TextEditingController emailCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    afterBuildCreated(() {
      changeStatusColor(appStore.isDarkModeOn ? context.cardColor : white);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Forgot Password?', center: true, color: context.cardColor),
      backgroundColor: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : LSColorSecondary,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            24.height,
            commonCacheImageWidget(LSForgot, 220, fit: BoxFit.cover).center(),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
              width: context.width(),
              child: Column(
                children: [
                  24.height,
                  Text('Enter the email address \n associated with your Account', style: boldTextStyle(), textAlign: TextAlign.center),
                  24.height,
                  Text('We will email you OTP to reset \n your password', style: secondaryTextStyle(), textAlign: TextAlign.center),
                  24.height,
                  AppTextField(
                    controller: emailCont,
                    textFieldType: TextFieldType.PASSWORD,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  24.height,
                ],
              ),
            ),
            24.height,
            AppButton(
              text: 'SEND',
              color: LSColorPrimary,
              textColor: white,
              width: context.width(),
              onTap: () {
                LSOtpScreen().launch(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
