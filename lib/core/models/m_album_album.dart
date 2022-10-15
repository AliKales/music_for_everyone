import 'package:json_annotation/json_annotation.dart';
import 'm_album_artist.dart';

part 'json_serializable/m_album_album.g.dart';

@JsonSerializable()
class MAlbumAlbum {
  int? id;
  String? title;
  String? link;
  String? cover;
  String? coverSmall;
  String? coverMedium;
  String? coverBig;
  String? coverXl;
  String? md5Image;
  String? recordType;
  String? tracklist;
  bool? explicitLyrics;
  int? position;
  MAlbumArtist? artist;
  String? type;

  MAlbumAlbum({
    this.id,
    this.title,
    this.link,
    this.cover,
    this.coverSmall,
    this.coverMedium,
    this.coverBig,
    this.coverXl,
    this.md5Image,
    this.recordType,
    this.tracklist,
    this.explicitLyrics,
    this.position,
    this.artist,
    this.type,
  });
 
  factory MAlbumAlbum.fromJson(Map<String, dynamic> json) => _$MAlbumAlbumFromJson(json);

  Map<String, dynamic> toJson() => _$MAlbumAlbumToJson(this);  
}       
