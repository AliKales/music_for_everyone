import 'package:dio/dio.dart';
import 'package:music_for_everyone/core/models/m_album_album.dart';
import 'package:music_for_everyone/core/models/m_artist_artist.dart';
import 'package:music_for_everyone/core/models/m_track_track.dart';
import 'package:music_for_everyone/core/services/dio/s_dio.dart';

class DioCharts extends SDio {
  DioCharts(super.dio);

  late final String mainPath = "$baseUrlDeezer/chart/0";

  Future<List<T>?> fetchChart<T>(Chart chart, [String? path]) async {
    path ??= "$mainPath/${chart.name}";
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

enum Chart {
  tracks,
  albums,
  artists,
}
