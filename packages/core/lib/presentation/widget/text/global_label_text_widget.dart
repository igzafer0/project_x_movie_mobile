import 'package:core/constant/color_constant.dart';
import 'package:core/enum/text_size.dart';
import 'package:core/extension/ui_extension.dart';
import 'package:flutter/material.dart';

class GlobalLabelTextWidget extends StatelessWidget {
  final String text;
  final TextSize size;
  final TextOverflow overflow;
  final Color color;
  final int? maxLines;
  final TextAlign? align;
  const GlobalLabelTextWidget(
      {super.key,
      required this.text,
      required this.size,
      this.color = ColorConstant.PRIMARY_TEXT_COLOR,
      this.overflow = TextOverflow.visible,
      this.align = TextAlign.left,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: overflow,
      textAlign: align,
      style: context
          .styler(size)
          .copyWith(color: color, overflow: TextOverflow.ellipsis),
      text,
      maxLines: maxLines,
    );
  }
}
