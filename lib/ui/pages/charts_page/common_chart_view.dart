import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:music_for_everyone/common_libs.dart';
import 'package:music_for_everyone/core/models/m_track_track.dart';
import 'package:music_for_everyone/core/services/dio/dio_charts.dart';
import 'package:music_for_everyone/styles/border_radius.dart';
import 'package:music_for_everyone/styles/colors.dart';
import 'package:music_for_everyone/ui/pages/charts_page/charts_views/chart_view_app_bar.dart';
import 'package:music_for_everyone/ui/widgets/c_buttons.dart';
import 'package:uikit/uikit.dart';

class CommonChartView<T> extends StatefulWidget {
  const CommonChartView({super.key, required this.chart, required this.item});

  final Chart chart;
  final Widget Function(dynamic) item;

  @override
  State<CommonChartView> createState() => _TracksViewState<T>();
}

class _TracksViewState<T> extends State<CommonChartView>
    with AutomaticKeepAliveClientMixin {
  List<T>? items;

  void _loadTracks() async {
    CustomProgressIndicator().showProgressIndicator(context);
    items = await DioCharts(Dio()).fetchChart<T>(widget.chart);
    Navigator.pop(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Padding(
      padding: AppPaddings.scaffold(context),
      child: Column(
        children: [
          ChartViewAppBar(context),
          const Spacer().toEmpty(items != null),
          items == null
              ? CElevatedButton(
                  context,
                  text: context.texts.load,
                  onPressed: _loadTracks,
                )
              : _items(),
          const Spacer().toEmpty(items != null),
        ],
      ),
    );
  }

  Expanded _items() {
    return Expanded(
      child: NoGlowScroll(
        child: ListView.separated(
          separatorBuilder: (context, index) => context.sizedBox(height: 0.03),
          itemCount: items!.length,
          itemBuilder: (context, index) {
            return widget.item.call(items![index]);
          },
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
