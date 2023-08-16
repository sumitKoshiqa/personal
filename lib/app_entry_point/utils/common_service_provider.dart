import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

Widget vSpacer([double height = 24]) => SizedBox(height: height);

Widget hSpacer([double width = 24]) => SizedBox(width: width);

final commonServices = CommonUtils();

class CommonUtils{



  Future<void> launch({String? url, bool isNewTab = true,bool isInAppView=true}) async {
    await launchUrl(
      Uri.parse(url!),
      webOnlyWindowName: isNewTab ? '_blank' : '_self',
      mode: isInAppView?LaunchMode.inAppWebView:LaunchMode.externalApplication
    );
  }

  String getAppID(){
    var uuid = const Uuid();
    return uuid.v1();
  }

  // Widget getDotsIndicator(int pageLength, int pageIndex) {
  //   return Padding(
  //       padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
  //       child: DotsIndicator(
  //         dotsCount: pageLength,
  //         position: pageIndex.toDouble(),
  //         decorator: DotsDecorator(
  //           size: const Size.square(8.0),
  //           spacing: EdgeInsets.all(4),
  //           activeSize: const Size(18.0, 4.0),
  //           activeShape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(5.0)),
  //         ),
  //       ));
  // }

}