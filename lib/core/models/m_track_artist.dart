import 'package:json_annotation/json_annotation.dart';

part 'json_serializable/m_track_artist.g.dart';

@JsonSerializable()
class MTrackArtist {
  int? id;
  String? name;
  String? link;
  String? picture;
  String? pictureSmall;
  String? pictureMedium;
  String? pictureBig;
  String? pictureXl;
  bool? radio;
  String? tracklist;
  String? type;

  MTrackArtist({
    this.id,
    this.name,
    this.link,
    this.picture,
    this.pictureSmall,
    this.pictureMedium,
    this.pictureBig,
    this.pictureXl,
    this.radio,
    this.tracklist,
    this.type,
  });
 
  factory MTrackArtist.fromJson(Map<String, dynamic> json) => _$MTrackArtistFromJson(json);

  Map<String, dynamic> toJson() => _$MTrackArtistToJson(this);  
}       
