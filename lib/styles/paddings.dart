import 'package:music_for_everyone/common_libs.dart';

class AppPaddings extends EdgeInsets {
  const AppPaddings.allSmall() : super.all(5);
  const AppPaddings.allMedium() : super.all(10);

  AppPaddings.navBarPadding(BuildContext context)
      : super.symmetric(vertical: 0.02.toDynamicHeight(context));

  AppPaddings.horizontalSmall(BuildContext context)
      : super.symmetric(horizontal: 0.05.toDynamicWidth(context));

  AppPaddings.verticalSmall(BuildContext context)
      : super.symmetric(vertical: 0.05.toDynamicWidth(context));

  AppPaddings.scaffold(BuildContext context)
      : super.fromLTRB(0.04.toDynamicWidth(context), 0,
            0.04.toDynamicWidth(context), 0.01.toDynamicWidth(context));
}
