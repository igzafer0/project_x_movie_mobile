import 'package:core/constant/color_constant.dart';
import 'package:core/core.dart';
import 'package:core/enum/text_size.dart';
import 'package:core/extension/ui_extension.dart';
import 'package:core/presentation/widget/image/global_network_image_widget.dart';
import 'package:flutter/material.dart';

class GoogleButton extends StatelessWidget {
  const GoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: ColorConstant.SECONDARY_COLOR, borderRadius: context.MidRadius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GlobalNetworkImageWidget(imagePath: "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png"),
          GlobalLabelTextWidget(text: "with Google", size: TextSize.PARAGRAPH)
        ],
      ),
    );
  }
}
