
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarkari_yojna_flutter/utils/logger/logger.dart';
import 'package:sarkari_yojna_flutter/widgets/image_view/default_image_views/default_error_image_view.dart';

class SyLocalAssetImage extends StatelessWidget {
  final String image;
  final String? loadingPlaceHolder;
  final String? defaultOrErrorPlaceHolder;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Logger? logger;
  final ColorFilter? colorFilter;

  const SyLocalAssetImage({
    super.key,
    required this.image,
    this.loadingPlaceHolder,
    this.defaultOrErrorPlaceHolder,
    this.fit,
    this.height,
    this.width,
    this.logger,
    this.colorFilter
  });

  @override
  Widget build(BuildContext context) {
    if (image.toLowerCase().contains(".svg")) {
      return SvgPicture.asset(
        image,
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        colorFilter: colorFilter,
      );
    } else {
      return Image.asset(
          image,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain, errorBuilder: (
        BuildContext context,
        Object object,
        StackTrace? s,
      ) {
        logger?.e(
          "SyLocalAssetImage",
          "error while loading '${image.toString()}'",
          Exception("error while loading '${image.toString()}'"),
          s: s,
        );

        return DefaultErrorPlaceHolderImageView(
          localResourcePath: loadingPlaceHolder,
          width: width,
          height: height,
          fit: fit,
        );
      });
    }
  }
}
