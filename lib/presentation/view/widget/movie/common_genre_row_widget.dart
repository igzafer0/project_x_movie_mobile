import 'package:flutter/material.dart';
import 'package:project_x_movie_mobile/data/dto/genre/genre_model.dart';
import 'package:project_x_movie_mobile/presentation/widget/image/global_network_image_widget.dart';
import 'package:project_x_movie_mobile/presentation/widget/text/global_label_text_widget.dart';
import 'package:project_x_movie_mobile/util/constant/color_constant.dart';
import 'package:project_x_movie_mobile/util/enum/text_size.dart';
import 'package:project_x_movie_mobile/util/extension/ui_extension.dart';

class CommonGenreRowWidget extends StatelessWidget {
  final GenreModel genreModel;
  const CommonGenreRowWidget({required this.genreModel, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        AspectRatio(
            aspectRatio: 1.77 / 1,
            child: GlobalNetworkImageWidget(imagePath: genreModel.poster)),
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
          child: GlobalLabelTextWidget(
              text: genreModel.name, size: TextSize.TITLE),
        ),
      ],
    );
  }
}
