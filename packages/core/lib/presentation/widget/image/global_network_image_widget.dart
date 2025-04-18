import 'package:core/constant/color_constant.dart';
import 'package:core/extension/ui_extension.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class GlobalNetworkImageWidget extends StatelessWidget {
  final String imagePath;

  const GlobalNetworkImageWidget({required this.imagePath, super.key});

  @override
  Widget build(BuildContext context) {
    if (imagePath.isNotEmpty && imagePath.startsWith("https://")) {
      if (imagePath == "https://image.tmdb.org/t/p/original") {
        return ClipRRect(
          borderRadius: context.SmallRadius,
          child: Image.network(
            "https://placehold.co/133x200/png",
            fit: BoxFit.cover,
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
      return ClipRRect(
        borderRadius: context.SmallRadius,
        child: Image.network(
          imagePath,
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Image.network("https://placehold.co/133x200/png", fit: BoxFit.cover);
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
