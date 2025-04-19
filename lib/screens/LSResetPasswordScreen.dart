import 'package:flutter/material.dart';
import 'package:laundry_service_app/main.dart';
import 'package:laundry_service_app/screens/LSOnBoardingScreen.dart';
import 'package:laundry_service_app/utils/LSColors.dart';
import 'package:laundry_service_app/utils/LSImages.dart';
import 'package:laundry_service_app/utils/LSWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class LSResetPasswordScreen extends StatefulWidget {
  static String tag = '/LSResetPasswordScreen';

  @override
  LSResetPasswordScreenState createState() => LSResetPasswordScreenState();
}

class LSResetPasswordScreenState extends State<LSResetPasswordScreen> {
  TextEditingController passCont = TextEditingController();
  TextEditingController cPassCont = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async{
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
      appBar: appBarWidget('Reset Password', center: true, color: context.cardColor),
      backgroundColor: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : LSColorSecondary,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            24.height,
            commonCacheImageWidget(LSReset, 220, fit: BoxFit.cover).center(),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
              width: context.width(),
              child: Column(
                children: [
                  24.height,
                  Text('Reset your password', style: boldTextStyle(), textAlign: TextAlign.center),
                  24.height,
                  AppTextField(
                    controller: passCont,
                    textFieldType: TextFieldType.PASSWORD,
                    decoration: InputDecoration(hintText: 'Password'),
                  ),
                  24.height,
                  AppTextField(
                    controller: cPassCont,
                    textFieldType: TextFieldType.PASSWORD,
                    decoration: InputDecoration(hintText: 'Confirm Password'),
                  ),
                  24.height,
                ],
              ),
            ),
            24.height,
            AppButton(
              text: 'RESET PASSWORD',
              color: LSColorPrimary,
              textColor: white,
              width: context.width(),
              onTap: (){
                LSOnBoardingScreen().launch(context);
              },
            )
          ],
        ),
      ),
    );
  }
}