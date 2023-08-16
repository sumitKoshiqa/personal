import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'svg_pictures.dart';

class InitializeAll {
  Future<void> initAll() async {
   WidgetsFlutterBinding.ensureInitialized();
      await SVGPictures().initAll();
      await ScreenUtil.ensureScreenSize();
    print("coming to start");
  }


}