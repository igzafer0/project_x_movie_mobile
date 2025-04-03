import 'package:core/extension/ui_extension.dart';
import 'package:core/presentation/widget/image/global_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:movie/data/model/credit/credit_model.dart';

class CreditWidget extends StatelessWidget {
  final CreditModel credit;
  const CreditWidget(this.credit, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.LargeRightSpacer,
      child: GlobalNetworkImageWidget(imagePath: credit.person.photo),
    );
  }
}
