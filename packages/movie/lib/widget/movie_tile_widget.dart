import 'package:core/presentation/widget/image/global_network_image_widget.dart';
import 'package:flutter/material.dart';

class MovieTileWidget extends StatelessWidget {
  final String imagePath;
  const MovieTileWidget({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1.5,
      child: GlobalNetworkImageWidget(imagePath: imagePath),
    );
  }
}
