import 'package:ekikrit/app_entry_point/utils/svg_pictures.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';

class InitializeAll {
  Future<void> initAll() async {
   WidgetsFlutterBinding.ensureInitialized();
      await SVGPictures().initAll();
      await ScreenUtil.ensureScreenSize();
    print("coming to start");
  }


}