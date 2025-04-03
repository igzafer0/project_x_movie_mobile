import 'package:core/constant/color_constant.dart';
import 'package:core/extension/ui_extension.dart';
import 'package:core/presentation/widget/image/global_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:movie/data/model/movie/movie_model.dart';

class MovieTileWithShadowWidget extends StatelessWidget {
  final MovieModel movie;
  const MovieTileWithShadowWidget(this.movie, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: context.ScreenWidth * 1.2,
          width: context.ScreenWidth,
          child: GlobalNetworkImageWidget(imagePath: movie.backdrop.contains("not found") ? movie.poster : movie.backdrop),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.transparent,
                ColorConstant.PRIMARY_COLOR.withValues(alpha: .1),
                ColorConstant.PRIMARY_COLOR,
              ],
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                ColorConstant.PRIMARY_COLOR.withValues(alpha: .1),
                ColorConstant.PRIMARY_COLOR,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
