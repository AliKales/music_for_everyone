import 'package:json_annotation/json_annotation.dart';

part 'json_serializable/m_track_album.g.dart';

@JsonSerializable()
class MTrackAlbum {
  int? id;
  String? title;
  String? cover;
  String? coverSmall;
  String? coverMedium;
  String? coverBig;
  String? coverXl;
  String? md5Image;
  String? tracklist;
  String? type;

  MTrackAlbum({
    this.id,
    this.title,
    this.cover,
    this.coverSmall,
    this.coverMedium,
    this.coverBig,
    this.coverXl,
    this.md5Image,
    this.tracklist,
    this.type,
  });
 
  factory MTrackAlbum.fromJson(Map<String, dynamic> json) => _$MTrackAlbumFromJson(json);

  Map<String, dynamic> toJson() => _$MTrackAlbumToJson(this);  
}       
