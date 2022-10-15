import 'package:dio/dio.dart';
import 'package:music_for_everyone/core/services/dio/s_dio.dart';
import 'package:music_for_everyone/styles/extensions.dart';
import 'package:music_for_everyone/ui/pages/search_page/m_search.dart';

import '../../models/m_album_album.dart';
import '../../models/m_artist_artist.dart';
import '../../models/m_track_track.dart';

class DioSearch extends SDio {
  DioSearch(super.dio);

  late final String mainPath = "$baseUrlDeezer/search";

  Future<List<T>?> fetchSearch<T>(MSearch search) async {
    String path =
        "$mainPath/${search.chart!.name.removeLast}?q=${search.query}";
    Response response = await dio.get(path);

    if (response.statusCode != 200) return null;

    List list = response.data['data'];

    if (T == MTrackTrack) {
      var result = list.map((e) => MTrackTrack.fromJson(e)).toList();
      return result.cast<T>();
    }

    if (T == MAlbumAlbum) {
      var result = list.map((e) => MAlbumAlbum.fromJson(e)).toList();
      return result.cast<T>();
    }

    if (T == MArtistArtist) {
      var result = list.map((e) => MArtistArtist.fromJson(e)).toList();
      return result.cast<T>();
    }

    return null;
  }
}
