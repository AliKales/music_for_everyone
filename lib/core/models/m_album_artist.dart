import 'package:json_annotation/json_annotation.dart';

part 'json_serializable/m_album_artist.g.dart';

@JsonSerializable()
class MAlbumArtist {
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

  MAlbumArtist({
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
 
  factory MAlbumArtist.fromJson(Map<String, dynamic> json) => _$MAlbumArtistFromJson(json);

  Map<String, dynamic> toJson() => _$MAlbumArtistToJson(this);  
}       
