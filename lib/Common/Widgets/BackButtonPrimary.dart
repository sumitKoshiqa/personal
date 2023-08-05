import 'package:ekikrit/App/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButtonPrimary extends StatefulWidget {
  const BackButtonPrimary({Key? key}) : super(key: key);

  @override
  State<BackButtonPrimary> createState() => _BackButtonPrimaryState();
}

class _BackButtonPrimaryState extends State<BackButtonPrimary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      decoration: BoxDecoration(
        color: Constants.accentOrange,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(),
          tooltip: "Back",
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.white,),
        ),
      ),
    );
  }
}
