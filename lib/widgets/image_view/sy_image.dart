import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sarkari_yojna_flutter/utils/logger/logger.dart';
import 'package:sarkari_yojna_flutter/widgets/image_view/default_image_views/default_error_image_view.dart';
import 'package:sarkari_yojna_flutter/widgets/image_view/sy_local_file_image.dart';
import 'package:sarkari_yojna_flutter/widgets/image_view/sy_local_asset_image.dart';
import 'package:sarkari_yojna_flutter/widgets/image_view/sy_network_image.dart';

///
/// An Image View that can load
/// - local file
/// - local asset file
/// - memory image
/// - network image
class SyImage extends StatelessWidget {
  final dynamic imageToLoadUrlOrPath;
  final String? loadingPlaceHolder;
  final String? defaultOrErrorPlaceHolder;

  final double? width;
  final double? height;
  final BoxFit? fit;
  final ColorFilter? color;
  final Logger? logger;

  const SyImage({
    super.key,
    this.width,
    this.height,
    required this.imageToLoadUrlOrPath,
    this.loadingPlaceHolder,
    this.defaultOrErrorPlaceHolder,
    this.color,
    this.fit,
    this.logger,
  });

  String? _getLoadingPlaceHolder() {
    return loadingPlaceHolder;
  }

  String? _getErrorPlaceHolder() {
    return defaultOrErrorPlaceHolder;
  }

  @override
  Widget build(BuildContext context) {
    if (!_isImageProvidedValid()) {
      return DefaultErrorPlaceHolderImageView(
        localResourcePath: defaultOrErrorPlaceHolder,
        width: width,
        height: height,
        fit: fit,
      );
    }
    debugPrint("Loading Image $imageToLoadUrlOrPath");

    final isImageFile = imageToLoadUrlOrPath is File;
    final isUrl = imageToLoadUrlOrPath is Uri ||
        (imageToLoadUrlOrPath is String &&
            Uri.parse(imageToLoadUrlOrPath).isAbsolute);
    final isImageALocalAsset = imageToLoadUrlOrPath is String;

    return _buildImageView(
      isImageFile,
      isUrl,
      isImageALocalAsset,
    );
  }

  bool _isImageProvidedValid() {
    if (imageToLoadUrlOrPath == null) {
      return false;
    }

    if (imageToLoadUrlOrPath is String?) {
      final imagePath = imageToLoadUrlOrPath as String?;

      if (imagePath == null || imagePath.trim().isEmpty) {
        return false;
      }
    }

    return true;
  }

  Widget _buildImageView(
    bool isImageFile,
    bool isUrl,
    bool isImageALocalAsset,
  ) {
    if (isImageFile) {
      return SyLocalFileImage(
        image: imageToLoadUrlOrPath,
        loadingPlaceHolder: _getLoadingPlaceHolder(),
        defaultOrErrorPlaceHolder: _getErrorPlaceHolder(),
        fit: fit,
        width: width,
        height: height,
      );
    } else if (isUrl) {
      final Uri finalUri;
      if (imageToLoadUrlOrPath is Uri) {
        finalUri = imageToLoadUrlOrPath;
      } else {
        finalUri = Uri.parse(imageToLoadUrlOrPath);
      }

      return SyNetworkImage(
        image: finalUri,
        loadingPlaceHolder: _getLoadingPlaceHolder(),
        defaultOrErrorPlaceHolder: _getErrorPlaceHolder(),
        fit: fit,
        width: width,
        height: height,
      );
    } else if (isImageALocalAsset) {
      return SyLocalAssetImage(
        image: imageToLoadUrlOrPath,
        loadingPlaceHolder: _getLoadingPlaceHolder(),
        defaultOrErrorPlaceHolder: _getErrorPlaceHolder(),
        fit: fit,
        width: width,
        height: height,
      );
    } else {
      throw "Image format not supported";
    }
  }
}
