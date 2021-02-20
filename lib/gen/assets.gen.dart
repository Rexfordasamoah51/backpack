/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  AssetGenImage get map => const AssetGenImage('assets/images/Map.png');
  AssetGenImage get air => const AssetGenImage('assets/images/air.jpg');
  AssetGenImage get backpack =>
      const AssetGenImage('assets/images/backpack.png');
  AssetGenImage get backpackIntro =>
      const AssetGenImage('assets/images/backpackIntro.png');
  AssetGenImage get backsplash =>
      const AssetGenImage('assets/images/backsplash.png');
  AssetGenImage get card => const AssetGenImage('assets/images/card.png');
  AssetGenImage get couple => const AssetGenImage('assets/images/couple.png');
  AssetGenImage get dot => const AssetGenImage('assets/images/dot.png');
  AssetGenImage get friend => const AssetGenImage('assets/images/friend.jpg');
  AssetGenImage get hub => const AssetGenImage('assets/images/hub.jpg');
  AssetGenImage get invite => const AssetGenImage('assets/images/invite.png');
  AssetGenImage get jerne => const AssetGenImage('assets/images/jerne.png');
  AssetGenImage get mapPin => const AssetGenImage('assets/images/map-pin.png');
  AssetGenImage get mapline => const AssetGenImage('assets/images/mapline.png');
  AssetGenImage get messageCircle =>
      const AssetGenImage('assets/images/message-circle.png');
  AssetGenImage get setting => const AssetGenImage('assets/images/setting.png');
  AssetGenImage get share => const AssetGenImage('assets/images/share.png');
  AssetGenImage get travel => const AssetGenImage('assets/images/travel.jpg');
  AssetGenImage get two => const AssetGenImage('assets/images/two.jpg');
  AssetGenImage get warningSign =>
      const AssetGenImage('assets/images/warning_sign.png');
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage extends AssetImage {
  const AssetGenImage(String assetName)
      : _assetName = assetName,
        super(assetName);
  final String _assetName;

  Image image({
    Key key,
    ImageFrameBuilder frameBuilder,
    ImageLoadingBuilder loadingBuilder,
    ImageErrorWidgetBuilder errorBuilder,
    String semanticLabel,
    bool excludeFromSemantics = false,
    double width,
    double height,
    Color color,
    BlendMode colorBlendMode,
    BoxFit fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    FilterQuality filterQuality = FilterQuality.low,
  }) {
    return Image(
      key: key,
      image: this,
      frameBuilder: frameBuilder,
      loadingBuilder: loadingBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      width: width,
      height: height,
      color: color,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      filterQuality: filterQuality,
    );
  }

  String get path => _assetName;
}
