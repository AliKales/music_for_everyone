import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:music_for_everyone/core/models/m_album_album.dart';
import 'package:music_for_everyone/core/models/m_track_track.dart';
import 'package:music_for_everyone/core/services/dio/dio_charts.dart';
import 'package:music_for_everyone/core/services/dio/dio_search.dart';
import 'package:music_for_everyone/ui/pages/search_page/m_search.dart';

void main() {
  test(
    "DEEZER CHART ALBUM",
    () async {
      expect(await DioCharts(Dio()).fetchChart<MAlbumAlbum>(Chart.albums),
          isA<List<MAlbumAlbum>>());
    },
  );
  test(
    "DEEZER CHART TRACK",
    () async {
      expect(await DioCharts(Dio()).fetchChart<MTrackTrack>(Chart.tracks),
          isA<List<MTrackTrack>>());
    },
  );

  test(
    "DEEZER SEARCH TEXT",
    () async {
      expect(
          await DioSearch(Dio())
              .fetchSearch<MTrackTrack>(const MSearch(query: "rap god")),
          isA<List<MTrackTrack>>());
    },
  );

  test(
    "DEEZER ARTIST TRACKS",
    () async {
      expect(
          await DioCharts(Dio()).fetchChart<MTrackTrack>(
              Chart.tracks, "/artist/8354140/top?limit=50"),
          isA<List<MTrackTrack>>());
    },
  );
}
