import 'dart:ui';

import 'package:core/core.dart';
import 'package:core/enum/text_size.dart';
import 'package:core/extension/ui_extension.dart';
import 'package:core/presentation/widget/image/global_network_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:movie/data/model/movie/movie_model.dart';

class MovieTileWidget extends StatelessWidget {
  final MovieModel movie;
  const MovieTileWidget({required this.movie, super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: movie.adult
          ? Stack(
              children: [
                GlobalNetworkImageWidget(imagePath: movie.poster),
                ClipRRect(
                  borderRadius: context.MidRadius,
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                    child: Container(
                      color: Colors.black.withValues(alpha: 0.5),
                      alignment: Alignment.center,
                      child: GlobalLabelTextWidget(text: "Adult", size: TextSize.BIG_TITLE),
                    ),
                  ),
                ),
              ],
            )
          : GlobalNetworkImageWidget(imagePath: movie.poster),
    );
  }
}
