import 'package:core/constant/color_constant.dart';
import 'package:core/core.dart';
import 'package:core/enum/text_size.dart';
import 'package:core/extension/ui_extension.dart';
import 'package:core/presentation/widget/image/global_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:movie/data/model/credit/credit_model.dart';

class CreditWidget extends StatelessWidget {
  final CreditModel credit;
  const CreditWidget(this.credit, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.LargeRightSpacer,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 200, child: GlobalNetworkImageWidget(imagePath: credit.person.photo)),
          Gap(context.SmallSpacer),
          SizedBox(
            width: 200 / 1.5,
            child: GlobalLabelTextWidget(
              text: credit.person.name,
              size: TextSize.BIG_PARAGRAPH,
              color: ColorConstant.APP_WHITE,
              maxLines: 2,
            ),
          ),
          Gap(context.SmallSpacer),
          SizedBox(
            width: 200 / 1.5,
            child: GlobalLabelTextWidget(
              text: credit.character,
              size: TextSize.PARAGRAPH,
              color: ColorConstant.APP_WHITE,
              maxLines: 2,
            ),
          )
        ],
      ),
    );
  }
}
