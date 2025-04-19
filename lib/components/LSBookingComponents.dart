import 'package:flutter/material.dart';
import 'package:laundry_service_app/main.dart';
import 'package:laundry_service_app/model/LSServiceModel.dart';
import 'package:laundry_service_app/utils/LSColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../screens/LSOrderDetailScreen.dart';
import '../utils/LSImages.dart';
import '../utils/LSWidgets.dart';

class LSBookingComponents extends StatefulWidget {
  static String tag = '/LSBookingComponents';

  @override
  LSBookingComponentsState createState() => LSBookingComponentsState();
}

class LSBookingComponentsState extends State<LSBookingComponents> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : LSColorSecondary.withOpacity(0.55),
      child: ListView.builder(
          itemCount: getBookingList().length,
          shrinkWrap: true,
          padding: EdgeInsets.all(8),
          itemBuilder: (_, i) {
            LSServiceModel data = getBookingList()[i];

            return Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(16),
              decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(data.title.validate(), style: boldTextStyle()),
                      Text('\$${data.amount.validate()}', style: boldTextStyle()),
                    ],
                  ),
                  4.height,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Order No - ${data.orderNo.validate()}',
                        style: boldTextStyle(), // Apply the same style to both parts
                      )
,
                      Text(data.status.validate(), style: boldTextStyle(color: LSColorPrimary)),
                    ],
                  ),
                  4.height,
                  Divider(),
                  4.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      commonCacheImageWidget(LSConfirm, 30, width: 30, fit: BoxFit.cover),
                      4.width,
                      Container(height: 1, color: grey.withOpacity(0.3)).expand(),
                      4.width,
                      commonCacheImageWidget(LSPickup, 30, width: 30, fit: BoxFit.cover),
                      4.width,
                      Container(height: 1, color: grey.withOpacity(0.3)).expand(),
                      4.width,
                      commonCacheImageWidget(LSInProgress, 30, width: 30, fit: BoxFit.cover),
                      4.width,
                      Container(height: 1, color: grey.withOpacity(0.3)).expand(),
                      4.width,
                      commonCacheImageWidget(LSShipping, 30, width: 30, fit: BoxFit.cover),
                      4.width,
                      Container(height: 1, color: grey.withOpacity(0.3)).expand(),
                      4.width,
                      commonCacheImageWidget(LSWalk3, 30, width: 30, fit: BoxFit.cover),
                    ],
                  ),
                ],
              ),
            ).onTap(() {
              LSOrderDetailScreen(data).launch(context);
            });
          }),
    );
  }
}
