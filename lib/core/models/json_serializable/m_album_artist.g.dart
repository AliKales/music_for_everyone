// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../m_album_artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MAlbumArtist _$MAlbumArtistFromJson(Map<String, dynamic> json) => MAlbumArtist(
      id: json['id'] as int?,
      name: json['name'] as String?,
      link: json['link'] as String?,
      picture: json['picture'] as String?,
      pictureSmall: json['pictureSmall'] as String?,
      pictureMedium: json['pictureMedium'] as String?,
      pictureBig: json['pictureBig'] as String?,
      pictureXl: json['pictureXl'] as String?,
      radio: json['radio'] as bool?,
      tracklist: json['tracklist'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$MAlbumArtistToJson(MAlbumArtist instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'link': instance.link,
      'picture': instance.picture,
      'pictureSmall': instance.pictureSmall,
      'pictureMedium': instance.pictureMedium,
      'pictureBig': instance.pictureBig,
      'pictureXl': instance.pictureXl,
      'radio': instance.radio,
      'tracklist': instance.tracklist,
      'type': instance.type,
    };
