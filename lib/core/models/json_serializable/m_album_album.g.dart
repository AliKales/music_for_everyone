// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../m_album_album.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MAlbumAlbum _$MAlbumAlbumFromJson(Map<String, dynamic> json) => MAlbumAlbum(
      id: json['id'] as int?,
      title: json['title'] as String?,
      link: json['link'] as String?,
      cover: json['cover'] as String?,
      coverSmall: json['coverSmall'] as String?,
      coverMedium: json['coverMedium'] as String?,
      coverBig: json['coverBig'] as String?,
      coverXl: json['coverXl'] as String?,
      md5Image: json['md5Image'] as String?,
      recordType: json['recordType'] as String?,
      tracklist: json['tracklist'] as String?,
      explicitLyrics: json['explicitLyrics'] as bool?,
      position: json['position'] as int?,
      artist: json['artist'] == null
          ? null
          : MAlbumArtist.fromJson(json['artist'] as Map<String, dynamic>),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$MAlbumAlbumToJson(MAlbumAlbum instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'link': instance.link,
      'cover': instance.cover,
      'coverSmall': instance.coverSmall,
      'coverMedium': instance.coverMedium,
      'coverBig': instance.coverBig,
      'coverXl': instance.coverXl,
      'md5Image': instance.md5Image,
      'recordType': instance.recordType,
      'tracklist': instance.tracklist,
      'explicitLyrics': instance.explicitLyrics,
      'position': instance.position,
      'artist': instance.artist,
      'type': instance.type,
    };
