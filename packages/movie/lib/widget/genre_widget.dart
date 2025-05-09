import 'package:core/constant/color_constant.dart';
import 'package:core/core.dart';
import 'package:core/enum/text_size.dart';
import 'package:core/extension/ui_extension.dart';
import 'package:flutter/material.dart';

class GenreWidget extends StatelessWidget {
  final String name;
  const GenreWidget({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 15, right: 15, top: 4, bottom: 4),
        decoration: BoxDecoration(
          color: ColorConstant.SECONDARY_COLOR,
          borderRadius: context.SmallRadius,
        ),
        child: GlobalLabelTextWidget(text: name, size: TextSize.TITLE));
  }
}
