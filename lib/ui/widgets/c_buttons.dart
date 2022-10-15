import 'package:flutter/material.dart';
import 'package:music_for_everyone/styles/border_radius.dart';
import 'package:music_for_everyone/styles/colors.dart';
import 'package:music_for_everyone/styles/texts.dart';

class CElevatedButton extends ElevatedButton {
  CElevatedButton(
    BuildContext context, {
    super.key,
    required String text,
    VoidCallback? onPressed,
  }) : super(
          onPressed: onPressed,
          child: Center(
            child: Text(
              text.toUpperCase(),
              style: Texts.filledButton(context),
            ),
          ),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: CustomBorderRadius.allSmallX(),
            ),
          ),
        );
}

class COutlinedButton extends OutlinedButton {
  COutlinedButton(
    BuildContext context, {
    super.key,
    required String text,
    VoidCallback? onPressed,
  }) : super(
          onPressed: onPressed,
          child: Center(
            child: Text(text),
          ),
          style: OutlinedButton.styleFrom(
            side: BorderSide(
              color: AppColors().accent1,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: CustomBorderRadius.allSmallX(),
            ),
          ),
        );
}
