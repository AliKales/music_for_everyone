import 'package:music_for_everyone/common_libs.dart';

class ChartViewAppBar extends AppBar {
  ChartViewAppBar(BuildContext context, {super.key})
      : super(
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_rounded),
          ),
        );
}
