import 'package:json_annotation/json_annotation.dart';
import 'm_track_album.dart';
import 'm_track_artist.dart';

part 'json_serializable/m_track_track.g.dart';


@JsonSerializable()
class MTrackTrack{
  int? id;
  String? title;
  String? titleShort;
  String? titleVersion;
  String? link;
  int? duration;
  int? rank;
  bool? explicitLyrics;
  int? explicitContentLyrics;
  int? explicitContentCover;
  String? preview;
  String? md5Image;
  int? position;
  MTrackArtist? artist;
  MTrackAlbum? album;
  String? type;

  MTrackTrack({
    this.id,
    this.title,
    this.titleShort,
    this.titleVersion,
    this.link,
    this.duration,
    this.rank,
    this.explicitLyrics,
    this.explicitContentLyrics,
    this.explicitContentCover,
    this.preview,
    this.md5Image,
    this.position,
    this.artist,
    this.album,
    this.type,
  });

  factory MTrackTrack.fromJson(Map<String, dynamic> json) =>
      _$MTrackTrackFromJson(json);

  Map<String, dynamic> toJson() => _$MTrackTrackToJson(this);
}
