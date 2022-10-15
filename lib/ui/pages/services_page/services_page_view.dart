import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:music_for_everyone/common_libs.dart';
import 'package:music_for_everyone/core/state_management/provider/provider_values.dart';
import 'package:music_for_everyone/gen/assets.gen.dart';
import 'package:music_for_everyone/ui/widgets/c_buttons.dart';

class ServicesPageView extends StatelessWidget {
  const ServicesPageView({super.key});

  void _handleTaps(BuildContext context, bool isCharts) {
    String path = isCharts ? "/charts" : "/search";
    context.go(path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Padding(
      padding: AppPaddings.scaffold(context),
      child: Column(
        children: [
          SizedBox(
            height: 0.2.toDynamicHeight(context),
            child: Assets.icons.happyMusic.svg(),
          ),
          const Spacer(),
          CElevatedButton(
            context,
            text: context.texts.charts,
            onPressed: () => _handleTaps(context, true),
          ),
          Padding(
            padding: AppPaddings.verticalSmall(context),
            child: Text(context.texts.or.toUpperCase()).toBold,
          ),
          COutlinedButton(
            context,
            text: context.texts.search,
            onPressed: () => _handleTaps(context, false),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
