import 'package:flutter/material.dart';

import '../../styles/colors.dart';

class IosArrowIcon extends RotatedBox {
  IosArrowIcon({
    super.key,
    int? quarterTurn,
    bool? isUp = false,
    double? size,
    VoidCallback? onPressed,
  }) : super(
          quarterTurns: quarterTurn ?? (isUp! ? 1 : 3),
          child: IconButton(
            onPressed: onPressed,
            padding: EdgeInsets.zero,
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: AppColors().white,
              size: size,
            ),
          ),
        );
}
