import 'package:json_annotation/json_annotation.dart';

part 'json_serializable/m_artist_artist.g.dart';

@JsonSerializable()
class MArtistArtist {
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
  int? position;
  String? type;

  MArtistArtist({
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
    this.position,
    this.type,
  });
 
  factory MArtistArtist.fromJson(Map<String, dynamic> json) => _$MArtistArtistFromJson(json);

  Map<String, dynamic> toJson() => _$MArtistArtistToJson(this);  
}       
