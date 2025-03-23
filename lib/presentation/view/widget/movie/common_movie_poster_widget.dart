import 'package:flutter/material.dart';
import 'package:project_x_movie_mobile/presentation/widget/image/global_network_image_widget.dart';

class CommonMoviePosterWidget extends StatelessWidget {
  final String imagePath;
  const CommonMoviePosterWidget({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: GlobalNetworkImageWidget(imagePath: imagePath),
    );
  }
}
