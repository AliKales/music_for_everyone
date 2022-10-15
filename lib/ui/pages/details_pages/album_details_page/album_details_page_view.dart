import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter_animate/animate.dart';
import 'package:flutter_animate/effects/effects.dart';
import 'package:music_for_everyone/common_libs.dart';
import 'package:music_for_everyone/core/models/m_album_album.dart';
import 'package:music_for_everyone/core/utils/model_utils.dart';
import 'package:music_for_everyone/ui/pages/charts_page/charts_views/artist_item.dart';
import 'package:music_for_everyone/ui/widgets/list_view_separated_tracks.dart';
import 'package:uikit/uikit.dart';

import '../../../../core/models/m_track_track.dart';
import '../../../../core/services/dio/dio_charts.dart';
import '../../../widgets/app_bar_with_opacity.dart';
import '../../../widgets/ios_arrow_icon.dart';

class AlbumDetailsPageView extends StatefulWidget {
  const AlbumDetailsPageView({super.key, required this.album});

  final MAlbumAlbum album;

  @override
  State<AlbumDetailsPageView> createState() => _AlbumDetailsPageViewState();
}

class _AlbumDetailsPageViewState extends State<AlbumDetailsPageView> {
  final ValueNotifier<double> _opacity = ValueNotifier<double>(0.0);

  final ScrollController _scrollController = ScrollController();

  List<MTrackTrack>? tracks;

  String get _title => widget.album.title ?? "";

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_listenScroll);
    context.afterBuild((p0) => _loadTracks());
  }

  void _loadTracks() {
    DioCharts(Dio())
        .fetchChart<MTrackTrack>(Chart.tracks, widget.album.tracklist)
        .then((value) {
      setState(() {
        tracks = value;
      });
    });
  }

  void _listenScroll() {
    _opacity.value =
        _scrollController.offset.toInt().toPercent(250).zeroToOnePercent;
  }

  void _scrollTop() {
    _scrollController.animateTo(0, duration: 300.ms, curve: Curves.bounceIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(context),
      floatingActionButton: _fAB(),
    );
  }

  ValueListenableBuilder<double> _fAB() {
    return ValueListenableBuilder(
      valueListenable: _opacity,
      builder: (context, value, child) {
        if (_opacity.value != 1.0) return const SizedBox.shrink();
        return FloatingActionButton(
          onPressed: _scrollTop,
          child: IosArrowIcon(isUp: true),
        ).animate().scale(duration: 100.ms);
      },
    );
  }

  Padding _body(BuildContext context) {
    return Padding(
      padding: AppPaddings.scaffold(context),
      child: NoGlowScroll(
        scrollController: _scrollController,
        child: Column(
          children: [
            context.sizedBox(height: 0.02, width: 1),
            CachedNetworkImage(imageUrl: widget.album.cover ?? ""),
            Text(_title,
                style: context.textTheme.headlineMedium!.colorBW.toBold),
            context.sizedBox(height: 0.02),
            ArtistItem(
                artist:
                    ModelUtils.albumArtistToArtistArtist(widget.album.artist!)),
            context.sizedBox(height: 0.02),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("${context.texts.albumSongs}:",
                  style: context.textTheme.headlineSmall),
            ),
            ListViewSeparatedTracks(
                tracks: tracks ?? [], pic: widget.album.artist?.picture ?? ""),
          ],
        ),
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: AppBar().preferredSize,
      child: ValueListenableBuilder(
          valueListenable: _opacity,
          builder: (_, value, __) {
            return AppBarWithOpacity(opacity: value, title: _title);
          }),
    );
  }
}
