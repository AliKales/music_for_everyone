import 'package:music_for_everyone/common_libs.dart';

class CustomBorderRadius extends BorderRadius {
  CustomBorderRadius.allSmallX()
      : super.all(Radius.circular(BorderRadiuses.smallX.value));

  CustomBorderRadius.allSmall()
      : super.all(Radius.circular(BorderRadiuses.small.value));

  CustomBorderRadius.allMedium()
      : super.all(Radius.circular(BorderRadiuses.medium.value));

  CustomBorderRadius.allLarge()
      : super.all(Radius.circular(BorderRadiuses.large.value));

  CustomBorderRadius.allCard() : super.all(const Radius.circular(18));
}

enum BorderRadiuses {
  smallX(7),
  small(14),
  medium(24),
  large(36);

  final double value;
  const BorderRadiuses(this.value);
}
