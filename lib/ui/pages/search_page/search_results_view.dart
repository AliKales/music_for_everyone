import 'package:dio/dio.dart';
import 'package:music_for_everyone/common_libs.dart';
import 'package:music_for_everyone/core/models/m_album_album.dart';
import 'package:music_for_everyone/core/models/m_artist_artist.dart';
import 'package:music_for_everyone/core/models/m_track_track.dart';
import 'package:music_for_everyone/core/services/dio/dio_charts.dart';
import 'package:music_for_everyone/core/services/dio/dio_search.dart';
import 'package:music_for_everyone/ui/pages/charts_page/charts_views/album_item.dart';
import 'package:music_for_everyone/ui/pages/charts_page/charts_views/artist_item.dart';
import 'package:music_for_everyone/ui/pages/charts_page/charts_views/track_item.dart';
import 'package:music_for_everyone/ui/pages/search_page/m_search.dart';

part 'search_results_mixin.dart';

class SearchResultsView extends StatefulWidget {
  const SearchResultsView({super.key, required this.search});

  final MSearch search;

  @override
  State<SearchResultsView> createState() => _SearchResultsViewState();
}

class _SearchResultsViewState extends State<SearchResultsView>
    with _SearchResultsMixin {
  List<Widget>? items = [];

  @override
  void didUpdateWidget(covariant SearchResultsView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.search != widget.search &&
        widget.search.query.isNotEmptyAndNull) {
      loadItems();
    }
  }

  void loadItems() async {
    setState(() {
      //Loading widget will be shown when it's null
      items = null;
    });

    if (widget.search.chart == Chart.tracks) {
      items = await fetchItems<MTrackTrack>(widget.search);
    } else if (widget.search.chart == Chart.albums) {
      items = await fetchItems<MAlbumAlbum>(widget.search);
    } else if (widget.search.chart == Chart.artists) {
      items = await fetchItems<MArtistArtist>(widget.search);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (items == null) {
      return Expanded(child: const CircularProgressIndicator.adaptive().center);
    }
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) => context.sizedBox(height: 0.03),
        itemCount: items!.length,
        itemBuilder: (context, index) => items![index],
      ),
    );
  }
}
