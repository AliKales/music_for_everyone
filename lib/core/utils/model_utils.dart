import 'package:music_for_everyone/core/models/m_album_artist.dart';
import 'package:music_for_everyone/core/models/m_artist_artist.dart';

class ModelUtils {
  static MArtistArtist albumArtistToArtistArtist(MAlbumArtist albumArtist) {
    Map<String, dynamic> artistArtistJson = MArtistArtist().toJson();
    Map<String, dynamic> albumArtistJson = albumArtist.toJson();

    albumArtistJson.forEach((key, value) {
      artistArtistJson[key] = value;
    });

    return MArtistArtist.fromJson(artistArtistJson);
  }
}
