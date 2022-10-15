part of 'charts_page_view.dart';

class _ChartsBody extends StatefulWidget {
  const _ChartsBody({required this.selectedPage});

  final int selectedPage;

  @override
  State<_ChartsBody> createState() => __ChartsBodyState();
}

class __ChartsBodyState extends State<_ChartsBody> {
  final PageController pageController = PageController(keepPage: true);

  @override
  void didUpdateWidget(covariant _ChartsBody oldWidget) {
    super.didUpdateWidget(oldWidget);

    pageController.animateToPage(widget.selectedPage,
        duration: 300.toDuration, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        _commonChartView<MTrackTrack>(Chart.tracks),
        _commonChartView<MAlbumAlbum>(Chart.albums),
        _commonChartView<MArtistArtist>(Chart.artists),
      ],
    );
  }

  CommonChartView _commonChartView<T>(Chart chart) {
    return CommonChartView<T>(
      chart: chart,
      item: (p0) {
        if (p0 is MTrackTrack) {
          return TrackItem(track: p0);
        } else if (p0 is MAlbumAlbum) {
          return AlbumItem(album: p0);
        } else if (p0 is MArtistArtist) {
          return ArtistItem(artist: p0);
        }
        return const SizedBox.shrink();
      },
    );
  }
}
