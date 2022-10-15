// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../m_track_artist.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MTrackArtist _$MTrackArtistFromJson(Map<String, dynamic> json) => MTrackArtist(
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

Map<String, dynamic> _$MTrackArtistToJson(MTrackArtist instance) =>
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
