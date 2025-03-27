import 'package:core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class GlobalTextFieldWidget extends StatefulWidget {
  final String initValue;
  final String hintText;
  final int? maxLength;

  final Function(String) newText;
  const GlobalTextFieldWidget({
    super.key,
    this.initValue = "",
    this.hintText = "",
    this.maxLength,
    required this.newText,
  });

  @override
  State<GlobalTextFieldWidget> createState() => _GlobalTextFieldlWidgetState();
}

class _GlobalTextFieldlWidgetState extends State<GlobalTextFieldWidget> {
  final _controller = TextEditingController();

  @override
  void initState() {
    _controller.addListener(() {
      widget.newText(_controller.text);
    });
    _controller.text = widget.initValue;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _textFieldWidget(context);
  }

  TextField _textFieldWidget(BuildContext context) {
    return TextField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      controller: _controller,
      autocorrect: false,
      autofocus: false,
      maxLength: widget.maxLength,
      cursorColor: ColorConstant.APP_WHITE,
      style: TextStyle(
        color: ColorConstant.APP_WHITE,
      ),
      decoration: InputDecoration.collapsed(
        hintStyle: TextStyle(
          color: ColorConstant.ALTERNATIVE_WHITE_SECOND,
        ),
        hintText: widget.hintText,
      ),
    );
  }
}
