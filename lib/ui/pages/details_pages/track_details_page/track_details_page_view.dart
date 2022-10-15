import 'package:cached_network_image/cached_network_image.dart';
import 'package:music_for_everyone/common_libs.dart';
import 'package:music_for_everyone/core/models/m_track_track.dart';
import 'package:music_for_everyone/styles/border_radius.dart';
import 'package:music_for_everyone/ui/widgets/c_app_bar.dart';
import 'package:music_for_everyone/ui/widgets/song_player_widget.dart';

class TrackDetailsPageView extends StatefulWidget {
  const TrackDetailsPageView(
      {super.key, required this.tag, required this.track});

  final int tag;
  final MTrackTrack track;

  @override
  State<TrackDetailsPageView> createState() => _TrackDetailsPageViewState();
}

class _TrackDetailsPageViewState extends State<TrackDetailsPageView> {
  String get _getPic => widget.track.artist?.picture ?? "";
  String get _getTitle => widget.track.title.toString();
  String get _getArtistName => widget.track.artist?.name ?? "";
  bool get _getExplicitLyric => widget.track.explicitLyrics ?? false;
  String get _getPreview => widget.track.preview ?? "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CAppBar(
        context,
        onBackButton: () => Navigator.pop(context),
      ),
      body: Column(
        children: [
          context.sizedBox(height: 0.02),
          _image(context, 0.5),
          Text(_getTitle,
              style: context.textTheme.headlineMedium!.colorBW.toBold),
          Text(_getArtistName, style: context.textTheme.headlineSmall),
          const Icon(Icons.explicit_rounded).toEmpty(!_getExplicitLyric),
          const Spacer(),
          SongPlayerWidget(
              imageLink: _getPic,
              title: _getTitle,
              artistName: _getArtistName,
              songUrl: _getPreview),
          context.sizedBox(height: 0.05),
        ],
      ).scaffoldPadding(context),
    );
  }

  Hero _image(BuildContext context, double size) {
    return Hero(
      tag: widget.tag,
      child: ClipRRect(
        borderRadius: CustomBorderRadius.allSmall(),
        child: CachedNetworkImage(
          imageUrl: _getPic,
          width: size.toDynamicWidth(context),
          height: size.toDynamicWidth(context),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
