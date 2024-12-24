import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sarkari_yojna_flutter/utils/logger/logger.dart';

import 'default_image_views/default_error_image_view.dart';
import 'default_image_views/default_loading_image_view.dart';

class SyNetworkImage extends StatelessWidget {
  final Uri image;
  final String? loadingPlaceHolder;
  final String? defaultOrErrorPlaceHolder;
  final BoxFit? fit;
  final double? width;
  final double? height;
  final Logger? logger;

  const SyNetworkImage({
    super.key,
    required this.image,
    this.loadingPlaceHolder,
    this.defaultOrErrorPlaceHolder,
    this.fit,
    this.height,
    this.width,
    this.logger,
  });

  @override
  Widget build(BuildContext context) {
    if (image.path.contains(".svg")) {
      return SvgPicture.network(
        image.toString(),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        placeholderBuilder: (BuildContext context) =>
            DefaultLoadingPlaceHolderImageView(
          localResourcePath: loadingPlaceHolder,
          width: width,
          height: height,
          fit: fit,
        ),
      );
    } else {
      // TODO use Cached network

      return Image.network(
        image.toString(),
        width: width,
        height: height,
        fit: fit ?? BoxFit.contain,
        // loadingBuilder: (
        //   BuildContext context,
        //   Widget child,
        //   ImageChunkEvent? loadingProgress,
        // ) =>
        //     DefaultLoadingPlaceHolderImageView(
        //   localResourcePath: loadingPlaceHolder,
        //   width: width,
        //   height: height,
        //   fit: fit,
        // ),
        errorBuilder: (BuildContext context, Object object, StackTrace? s) {
          logger?.e(
            "SyNetworkImage",
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
        },
      );
    }
  }
}
