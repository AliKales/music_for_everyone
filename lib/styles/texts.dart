import 'package:music_for_everyone/common_libs.dart';
import 'package:music_for_everyone/styles/colors.dart';

class Texts {
  Texts._();

  static TextStyle serviceItem(BuildContext context) =>
      context.textTheme.headlineSmall!
          .copyWith(color: AppColors().blackOrWhite);

  static TextStyle filledButton(BuildContext context) =>
      context.textTheme.button!.copyWith(
        color: AppColors().white,
        fontWeight: FontWeight.bold,
      );
}
