import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackButtonSecondary extends StatefulWidget {
  const BackButtonSecondary({Key? key}) : super(key: key);

  @override
  State<BackButtonSecondary> createState() => _BackButtonSecondaryState();
}

class _BackButtonSecondaryState extends State<BackButtonSecondary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      child: Center(
        child: IconButton(
          tooltip: "Back",
          onPressed: (){
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new, size: 18, color: Colors.black,),
        ),
      ),
    );
  }
}
