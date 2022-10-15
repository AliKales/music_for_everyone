// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../m_artist_artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MArtistArtist _$MArtistArtistFromJson(Map<String, dynamic> json) =>
    MArtistArtist(
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
      position: json['position'] as int?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$MArtistArtistToJson(MArtistArtist instance) =>
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
      'position': instance.position,
      'type': instance.type,
    };
