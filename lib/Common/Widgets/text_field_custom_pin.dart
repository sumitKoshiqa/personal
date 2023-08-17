import 'dart:collection';
import 'package:ekikrit/Common/utils/Constants.dart';
import 'package:flutter/material.dart';

///your listData length must be equals otp code length.

class MyTextFieldPin extends StatefulWidget {
  final Function(String, bool)? onOtpCallback;
  final double boxSize;
  final InputBorder? borderStyle;
  final bool filled;
  final int codeLength;
  final filledColor;
  final TextStyle? textStyle;
  final double margin;
  final InputBorder? borderStyeAfterTextChange;
  final bool filledAfterTextChange;

  MyTextFieldPin(
      {Key? key,
        this.onOtpCallback,
        this.boxSize = 60,
        this.borderStyle,
        this.filled = false,
        this.filledColor = Colors.white,
        this.codeLength = 6,
        this.textStyle,
        this.margin = 16,
        this.borderStyeAfterTextChange,
        this.filledAfterTextChange = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyTextFieldPinState();
  }
}

class _MyTextFieldPinState extends State<MyTextFieldPin> {
  List<FocusNode> focusNode = [];
  List<TextEditingController> textController = [];

  List<OtpDefaultData> mListOtpData = [];
  HashMap<int, String> mapResult = HashMap();

  String _smsCode = "";
  int _nextFocus = 1;
  String _result = "";
  InputBorder? _borderAfterTextChange;

  @override
  void dispose() {
    super.dispose();
    for (int i = 0; i < mListOtpData.length; i++) {
      textController[i].dispose();
    }
    // SmsVerification.stopListening();
  }

  @override
  void initState() {
    super.initState();

    _setDefaultTextFieldData();

    _startListeningOtpCode();
    if (widget.borderStyeAfterTextChange == null) {
      _borderAfterTextChange = OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(width: 0));
    } else {
      _borderAfterTextChange = widget.borderStyeAfterTextChange;
    }
  }

  void _setDefaultTextFieldData() {
    for (int i = 0; i < widget.codeLength; i++) {
      mListOtpData.add(OtpDefaultData(''));
      focusNode.add(FocusNode());
      textController.add(TextEditingController());
    }
  }

  /// listen sms
  _startListeningOtpCode() async {
    // String smsCode = await SmsVerification.startListeningSms();
    String smsCode = '';
    _smsCode = getCode(smsCode);

    setState(() {
      _autoFillCode();
    });
  }

  /// auto fill code
  /// clear first list otp data
  /// clear textController
  /// add listOtpData from smsCode value
  _autoFillCode() {
    if (_smsCode != null) {
      mListOtpData.clear();
      textController.clear();
      focusNode.clear();
      List<String> arrCode = _smsCode.split("");
      for (int i = 0; i < arrCode.length; i++) {
        mListOtpData.add(OtpDefaultData(arrCode[i]));
        focusNode.add(new FocusNode());
        textController
            .add(new TextEditingController(text: mListOtpData[i].code));

        _otpNumberCallback(i, true);
      }
    }
  }

  /// get number from message ex: your code : 45678 blablabla blabla
  getCode(String sms) {
    if (sms != null && sms.isNotEmpty) {
      final intRegex = RegExp(r'\d+', multiLine: true);
      final code = intRegex.allMatches(sms).first.group(0);

      return code;
    }
    return null;
  }

  /// get value from textController
  /// check if value already in hashmap ? update value : insert value
  /// convert all values hashmap to string, set as result otp
  _otpNumberCallback(int i, bool isAutoFill) {
    if (mapResult.containsKey(i)) {
      mapResult.update(i, (e) => textController[i].text);
    } else {
      mapResult.putIfAbsent(i, () => textController[i].text);
    }
    _result = mapResult.values
        .toString()
        .replaceAll("(", "")
        .replaceAll(")", "")
        .replaceAll(",", "")
        .replaceAll(" ", "");
    widget.onOtpCallback!(_result, isAutoFill);
  }

  @override
  Widget build(BuildContext context) {
    InputBorder _border = widget.borderStyle!;

    if (_border == null) {
      _border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: BorderSide(
          // color: Colors.white,
          width: 0,
        ),
      );
    }

    return Container(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: mListOtpData.length,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return Container(
              width: 40,
              height: 60,
              decoration: BoxDecoration(
                // color: Colors.white,
                border: Border.all(color: Constants.lightOrange),
                borderRadius: BorderRadius.circular(5.0),
              ),
              margin: EdgeInsets.only(
                  right:10),
              child: Center(
                child: textFieldFill(
                  focusNode: focusNode[i],
                  textEditingController: textController[i],
                  border: _getBorder(i),
                  isFilled: _isFilled(i),
                  onTextChange: (value) {
                    if (value.length > 1) {
                      textController[i].text = value[1];
                    }
                    _otpNumberCallback(i , false);

                    if (value.toString().length > 0) {
                      if (i < mListOtpData.length - 1) {
                        _nextFocus = i + 1;
                        FocusScope.of(context)
                            .requestFocus(focusNode[_nextFocus]);
                      }
                    } else {
                      if (i >= 1) {
                        _nextFocus = i - 1;
                        FocusScope.of(context)
                            .requestFocus(focusNode[_nextFocus]);
                      }
                    }
                  },
                ),
              ),
            );
          }),
    );
  }

  InputBorder _getBorder(int i) {
    return (textController[i].text.length >= 1)
        ? _borderAfterTextChange!
        : widget.borderStyle!;
  }

  bool _isFilled(int i) {
    return textController[i].text.length >= 1
        ? widget.filledAfterTextChange
        : widget.filled;
  }

  Widget textFieldFill(
      {ValueChanged? onTextChange,
        FocusNode? focusNode,
        TextEditingController? textEditingController,
        InputBorder? border,
        bool? isFilled}) {
    return SizedBox(
      child: TextFormField(
          focusNode: focusNode,
          autofocus: true,
          maxLength: 2, // this allows overwriting previous entry
          showCursor: false,
          scrollPadding: EdgeInsets.all(0),
          cursorWidth: 0,
          enableInteractiveSelection: false,
          autocorrect: false,
          textAlign: TextAlign.center,
          style: widget.textStyle,
          decoration: InputDecoration(
              // filled: isFilled,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 0,
                ),
              ),
              // fillColor: widget.filledColor,
              // isDense: true,
              counterText: ""),
          keyboardType: TextInputType.number,
          onChanged: onTextChange,
          controller: textEditingController,
          // inputFormatters: <TextInputFormatter>[
          //   WhitelistingTextInputFormatter.digitsOnly
          // ]
      ),
    );
  }
}

class OtpDefaultData {
  String code;

  OtpDefaultData(this.code);
}
