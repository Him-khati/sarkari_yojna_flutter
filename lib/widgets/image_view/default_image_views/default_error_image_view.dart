import 'package:flutter/material.dart';
import 'package:sarkari_yojna_flutter/widgets/image_view/sy_local_asset_image.dart';


class DefaultErrorPlaceHolderImageView extends StatelessWidget {

  final String? localResourcePath;
  final double? width;
  final double? height;
  final BoxFit? fit;

  const DefaultErrorPlaceHolderImageView({
    super.key,
    this.localResourcePath,
    this.width,
    this.height,
    this.fit
  });

  @override
  Widget build(BuildContext context) {
    return SyLocalAssetImage(
      image: localResourcePath ?? "hyhyh", // TODO fix,
      fit: fit,
      height: height,
      width: width,
    );
  }
}
