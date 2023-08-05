
import 'package:ekikrit/app_entry_point/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFieldPrimary extends StatefulWidget {
  final String? hint, imagePath;
  final Color? color, disabledColor;
  final Function? onChanged;
  final TextEditingController? textEditingController;

  const TextFieldPrimary({required this.color, required this.hint,
    required this.imagePath, this.onChanged,
    required this.textEditingController, this.disabledColor, Key? key}) : super(key: key);

  @override
  State<TextFieldPrimary> createState() => _TextFieldPrimaryState();
}

class _TextFieldPrimaryState extends State<TextFieldPrimary> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          color: widget.color,
          border: Border.all(color: widget.color == Constants.lightGreen ? Constants.accentGreen : Constants.accentOrange),
          borderRadius: BorderRadius.circular(12)
      ),
      child: Theme(
        data: ThemeData(
          disabledColor: widget.disabledColor ?? Colors.black
        ),
        child: TextField(
            controller: widget.textEditingController,
            onChanged: (value){
              widget.onChanged!(value);
            },
            enabled: false,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: widget.hint,
              contentPadding: const EdgeInsets.all(4),
              labelStyle: Get.textTheme.titleMedium!.copyWith(
                  color: Colors.grey.shade600
              ),
              hintText: widget.hint,
              prefixIcon: SizedBox(
                height: 5,
                width: 5,
                child: Padding(
                  padding: widget.imagePath! == "assets/your-account/phone.png" ? const EdgeInsets.all(12) : const EdgeInsets.only(top: 10, bottom: 10, ),
                  child: Image(
                    image: AssetImage(widget.imagePath!),
                  ),
                ),
              ),
            )
        ),
      ),
    );
  }
}
