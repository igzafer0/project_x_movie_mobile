import 'package:flutter/material.dart';
import 'package:project_x_movie_mobile/util/constant/color_constant.dart';
import 'package:project_x_movie_mobile/util/extension/ui_extension.dart';
import 'package:shimmer/shimmer.dart';

class GlobalNetworkImageWidget extends StatelessWidget {
  final String imagePath;

  const GlobalNetworkImageWidget({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    if (imagePath.isNotEmpty && imagePath.startsWith("https://")) {
      return ClipRRect(
        borderRadius: context.MidRadius,
        child: Image.network(
          imagePath,
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.network(imagePath, fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: CircularProgressIndicator(
                  color: ColorConstant.APP_ORANGE,
                  value: 100,
                ),
              );
            });
          },
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return Shimmer.fromColors(
              direction: ShimmerDirection.ltr,
              period: const Duration(milliseconds: 700),
              baseColor: ColorConstant.PRIMARY_COLOR,
              highlightColor: ColorConstant.SECONDARY_COLOR,
              child: Container(
                color: ColorConstant.PRIMARY_COLOR,
              ),
            );
          },
        ),
      );
    }
    return const SizedBox.shrink();
  }
}
