import 'package:flutter_svg/flutter_svg.dart';

class SVGPictures {
  static final SVGPictures _instance = SVGPictures._internal();

  factory SVGPictures() {
    return _instance;
  }

  SVGPictures._internal() {
    initAll();
  }

  SvgPicture? _add_disease;
  SvgPicture? _family_members;
  SvgPicture? _my_doctors;
  SvgPicture? _recommendation;

  SvgPicture? get add_disease => _add_disease;

  SvgPicture? get family_members => _family_members;

  SvgPicture? get my_doctors => _my_doctors;

  SvgPicture? get recommendation => _recommendation;

  Future<void> initAll() async {
    try {

    } catch (e) {
      print("$e");
    }
  }
}