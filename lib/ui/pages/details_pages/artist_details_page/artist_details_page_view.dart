import 'package:dio/dio.dart';
import 'package:music_for_everyone/common_libs.dart';
import 'package:music_for_everyone/core/models/m_artist_artist.dart';
import 'package:music_for_everyone/core/models/m_track_track.dart';
import 'package:music_for_everyone/core/services/dio/dio_charts.dart';
import 'package:music_for_everyone/ui/widgets/circe_image.dart';
import 'package:music_for_everyone/ui/widgets/ios_arrow_icon.dart';
import 'package:music_for_everyone/ui/widgets/list_view_separated_tracks.dart';
import 'package:uikit/uikit.dart';

import '../../../widgets/app_bar_with_opacity.dart';

class ArtistDetailsPageView extends StatefulWidget {
  const ArtistDetailsPageView(
      {super.key, required this.artist, required this.position});

  final MArtistArtist artist;
  final int? position;

  @override
  State<ArtistDetailsPageView> createState() => _ArtistDetailsPageViewState();
}

class _ArtistDetailsPageViewState extends State<ArtistDetailsPageView> {
  final ValueNotifier<double> _opacity = ValueNotifier<double>(0.0);

  final ScrollController _scrollController = ScrollController();
  List<MTrackTrack>? tracks;

  String get _getName => widget.artist.name ?? "";

  String get _getPic => widget.artist.picture ?? "";

  String get _getArtistsTracks {
    return "${context.texts.artistsTracks.localize({
          'name': widget.artist.name!
        })}:";
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_listenScroll);
    context.afterBuild((p0) => _loadTracks());
  }

  void _loadTracks() {
    DioCharts(Dio())
        .fetchChart<MTrackTrack>(Chart.tracks, widget.artist.tracklist)
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
      builder: (context, value, child) => Opacity(
        opacity: _opacity.value,
        child: FloatingActionButton(
          onPressed: _scrollTop,
          child: IosArrowIcon(isUp: true),
        ),
      ),
    );
  }

  NoGlowScroll _body(BuildContext context) {
    return NoGlowScroll(
      scrollController: _scrollController,
      child: Column(
        children: [
          context.sizedBox(height: 0.02, width: 1),
          Hero(
            tag: widget.artist.id!,
            child: CircleImage(imageLink: _getPic, size: 0.5),
          ),
          Text(_getName,
              style: context.textTheme.headlineMedium!.colorBW.toBold),
          context.sizedBox(height: 0.02),
          Align(
            alignment: Alignment.centerLeft,
            child:
                Text(_getArtistsTracks, style: context.textTheme.headlineSmall),
          ),
          ListViewSeparatedTracks(tracks: tracks ?? [], pic: _getPic)
              .loading(tracks == null),
        ],
      ).scaffoldPadding(context),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: AppBar().preferredSize,
      child: ValueListenableBuilder(
          valueListenable: _opacity,
          builder: (_, value, __) {
            return AppBarWithOpacity(opacity: value, title: _getName);
          }),
    );
  }
}
