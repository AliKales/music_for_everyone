import 'dart:io';

import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:music_for_everyone/common_libs.dart';
import 'package:music_for_everyone/core/models/m_album_album.dart';
import 'package:music_for_everyone/core/models/m_artist_artist.dart';
import 'package:music_for_everyone/core/models/m_track_track.dart';
import 'package:music_for_everyone/core/services/dio/dio_charts.dart';
import 'package:music_for_everyone/core/state_management/provider/provider_values.dart';
import 'package:music_for_everyone/ui/pages/charts_page/charts_views/album_item.dart';
import 'package:music_for_everyone/ui/pages/charts_page/charts_views/artist_item.dart';
import 'package:music_for_everyone/ui/pages/charts_page/charts_views/track_item.dart';
import 'package:music_for_everyone/ui/pages/charts_page/common_chart_view.dart';
import 'package:music_for_everyone/ui/widgets/c_bottom_tabs_bar.dart';
part 'chart_app_bar.dart';
part 'charts_body.dart';

class ChartsPageView extends StatefulWidget {
  const ChartsPageView({super.key});

  @override
  State<ChartsPageView> createState() => _ChartsPageViewState();
}

class _ChartsPageViewState extends State<ChartsPageView> {
  int _selectedPage = 0;

  late final List<String> items;

  @override
  void initState() {
    super.initState();
    items = context.provider<ProviderValues>().chartItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _ChartsBody(
            selectedPage: _selectedPage,
          ),
          _ChartAppBar(context, items[_selectedPage]),
        ],
      ),
      bottomNavigationBar: CBottomTabsBar(
        selectedPage: _selectedPage,
        items: items,
        onTabPress: (p0) {
          setState(() {
            _selectedPage = p0;
          });
        },
      ),
    ).withBackFunc(context);
  }
}
