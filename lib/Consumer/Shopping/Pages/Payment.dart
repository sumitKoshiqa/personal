import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:ekikrit/Common/utils/ShowMessages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';
import '../Controller/CartController.dart';
import 'PaymentConfirm.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';

class Payment extends StatefulWidget {
  final String? pi, amount;
  const Payment({this.pi, this.amount, Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {

  CartController cartController = Get.put(CartController());

  bool showLoader = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [

                // nav bar
                Container(
                  height: 50,
                  color: Constants.accentGreen,
                  child: Row(
                    children: [

                      Expanded(
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: (){
                                Get.back();
                              },
                              icon: const Icon(Icons.arrow_back_ios, size: 18,),
                            ),

                            const Expanded(
                              child: Text("Payment",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ],
                        ),
                      ),

                      IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.search),
                      ),

                      IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.notifications_none_outlined),
                      ),

                    ],
                  ),
                ),

                Expanded(
                  child: InAppWebView(
                    initialUrlRequest: URLRequest(url: Uri.parse('https://pinpointcode.com/stripe/checkout?amount=${widget.amount}&pi=${widget.pi}')),
                    androidOnPermissionRequest: (InAppWebViewController controller, String origin, List<String> resources) async {
                      return PermissionRequestResponse(resources: resources, action: PermissionRequestResponseAction.GRANT);
                    },
                    initialOptions: InAppWebViewGroupOptions(
                        crossPlatform: InAppWebViewOptions(
                          mediaPlaybackRequiresUserGesture: false,
                        ),
                        android: AndroidInAppWebViewOptions(
                          useHybridComposition: true,
                          allowContentAccess: true,
                          allowFileAccess: true,
                          domStorageEnabled: true,
                          safeBrowsingEnabled: false,

                        ),
                        ios: IOSInAppWebViewOptions(
                          allowsInlineMediaPlayback: true,
                        )
                    ),
                    onLoadStart: (controller, url) async{
                      setState(() {
                        showLoader = true;
                      });
                      print("URL request Params onLoadStart ${url!.queryParameters}");
                      if (url.queryParameters["redirect_status"] == "succeeded"){
                        Get.off(const PaymentConfirm());
                        cartController.getCartItems();
                      }
                      print("Url request started $url");
                    },
                    onLoadStop: (controller, uri){
                      setState(() {
                        showLoader = false;
                      });
                    },
                    onConsoleMessage: (controller, consoleMessage){
                      print("Console Message $consoleMessage");
                      if (consoleMessage.message.contains("Unhandled payment Element")){
                        print("Payment element error ............. $consoleMessage");
                      }else if (consoleMessage.message.contains("Error in payment code")){
                        ShowMessages().showSnackBarRed("Error in payment", consoleMessage.message);
                      }
                    },
                    shouldOverrideUrlLoading: (controller, navigationAction) async {
                      var uri = navigationAction.request.url!;
                      print("URL request Params ${uri.queryParameters}");
                      print("Url request to $uri");
                      if (![
                        "http",
                        "https",
                        "file",
                        "chrome",
                        "data",
                        "javascript",
                        "about",
                        "zoomus",
                        "zoom",
                        "zoomus://"
                      ].contains(uri.scheme)) {

                      }
                      return NavigationActionPolicy.ALLOW;
                    },
                  ),
                ),

                showLoader ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: CircularProgressIndicator(),
                    )
                  ],
                ) : Container()



              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  initState() {
    super.initState();
  }
}
