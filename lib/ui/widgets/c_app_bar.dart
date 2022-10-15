import 'package:go_router/go_router.dart';
import 'package:music_for_everyone/common_libs.dart';

import '../../styles/colors.dart';

class CAppBar extends AppBar {
  CAppBar(BuildContext context,
      {super.key,
      String? title,
      bool isBackActive = false,
      VoidCallback? onBackButton})
      : super(
          elevation: 0,
          leading: IconButton(
            onPressed: onBackButton ??
                () {
                  context.go("/");
                },
            icon: Icon(Icons.arrow_back_ios_new_sharp,
                color: AppColors().blackOrWhiteReverse),
          ).toVisible(isBackActive),
          title: Text(
            title ?? "",
            style: TextStyle(color: AppColors().blackOrWhiteReverse),
          ).toVisible(title == null),
        );
}
