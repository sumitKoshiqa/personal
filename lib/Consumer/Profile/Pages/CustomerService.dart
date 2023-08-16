import 'package:ekikrit/Common/Widgets/ButtonPrimary.dart';
import 'package:ekikrit/Common/Widgets/ButtonSecondary.dart';
import 'package:ekikrit/Common/Widgets/NavBar.dart';
import 'package:ekikrit/Common/utils/CustomSpacers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerService extends StatefulWidget {
  const CustomerService({Key? key}) : super(key: key);

  @override
  State<CustomerService> createState() => _CustomerServiceState();
}

class _CustomerServiceState extends State<CustomerService> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            child: Column(
              children: [

                const NavBar(title: "Customer Service",),

                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 10),
                  child: Text("Write to us for feedback or any queries. We will be happy to help",
                    style: Get.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        fontSize: 14
                    ),
                  ),
                ),

                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(15),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.orange.shade200)
                    ),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(hintText: "Write your message",),
                              scrollPadding: EdgeInsets.all(20.0),
                              keyboardType: TextInputType.multiline,
                              maxLines: 300,
                              style: Get.textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 14
                              ),
                              autofocus: true,)
                          ],
                        ),
                      ),
                  ),
                  )
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: ButtonPrimary(
                          onTap: (){
                            Get.back();
                          },
                          buttonText: "Cancel",
                        ),
                      ),

                      CustomSpacers.width10,
                      CustomSpacers.width10,

                      Expanded(
                        child: ButtonSecondary(
                          onTap: (){
                            Get.back();
                          },
                          buttonText: "Send",
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
