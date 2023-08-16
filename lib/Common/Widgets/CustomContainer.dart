import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainer extends StatefulWidget {
  final Widget layout;
  const CustomContainer({required this.layout, Key? key}) : super(key: key);

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Scaffold(
          body: Container(
            height: Get.height,
            width: Get.width,
            child: Stack(
              children: [


                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: Get.height * 0.15,
                    width: Get.width,
                    decoration: const BoxDecoration(
                       image: DecorationImage(
                         image: AssetImage('assets/drawer-consumer/container_bottom_bg.png'),
                         fit: BoxFit.fill
                       )
                    ),
                  ),
                ),

                widget.layout,

              ],
            ),
          ),
        ),
      ),
    );
  }
}
