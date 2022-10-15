import 'package:flutter/services.dart';
import 'package:music_for_everyone/common_libs.dart';

import '../../styles/colors.dart';
import 'ios_arrow_icon.dart';

class AppBarWithOpacity extends StatelessWidget {
  const AppBarWithOpacity({
    Key? key,
    required String title,
    required this.opacity,
  })  : _getName = title,
        super(key: key);

  final String _getName;
  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: AppBar(
        leading: IosArrowIcon(
          quarterTurn: 4,
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(_getName, style: TextStyle(color: AppColors().white)),
        systemOverlayStyle: opacity > 0.5
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
      ),
    );
  }
}
