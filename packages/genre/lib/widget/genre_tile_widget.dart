import 'package:core/constant/color_constant.dart';
import 'package:core/enum/text_size.dart';
import 'package:core/extension/ui_extension.dart';
import 'package:core/presentation/widget/image/global_network_image_widget.dart';
import 'package:core/presentation/widget/text/global_label_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:genre/data/model/genre/genre_model.dart';

class GenreTileWidget extends StatelessWidget {
  final GenreModel genreModel;
  const GenreTileWidget({required this.genreModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        AspectRatio(aspectRatio: 1.77 / 1, child: GlobalNetworkImageWidget(imagePath: genreModel.poster)),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [
                  Colors.transparent,
                  ColorConstant.PRIMARY_COLOR.withValues(alpha: .7),
                  ColorConstant.PRIMARY_COLOR,
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: context.MidHorizontalSpacer,
          child: GlobalLabelTextWidget(text: genreModel.name, size: TextSize.TITLE),
        ),
      ],
    );
  }
}
