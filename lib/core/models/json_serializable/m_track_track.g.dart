// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../m_track_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MTrackTrack _$MTrackTrackFromJson(Map<String, dynamic> json) => MTrackTrack(
      id: json['id'] as int?,
      title: json['title'] as String?,
      titleShort: json['titleShort'] as String?,
      titleVersion: json['titleVersion'] as String?,
      link: json['link'] as String?,
      duration: json['duration'] as int?,
      rank: json['rank'] as int?,
      explicitLyrics: json['explicitLyrics'] as bool?,
      explicitContentLyrics: json['explicitContentLyrics'] as int?,
      explicitContentCover: json['explicitContentCover'] as int?,
      preview: json['preview'] as String?,
      md5Image: json['md5Image'] as String?,
      position: json['position'] as int?,
      artist: json['artist'] == null
          ? null
          : MTrackArtist.fromJson(json['artist'] as Map<String, dynamic>),
      album: json['album'] == null
          ? null
          : MTrackAlbum.fromJson(json['album'] as Map<String, dynamic>),
      type: json['type'] as String?,
    );

Map<String, dynamic> _$MTrackTrackToJson(MTrackTrack instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'titleShort': instance.titleShort,
      'titleVersion': instance.titleVersion,
      'link': instance.link,
      'duration': instance.duration,
      'rank': instance.rank,
      'explicitLyrics': instance.explicitLyrics,
      'explicitContentLyrics': instance.explicitContentLyrics,
      'explicitContentCover': instance.explicitContentCover,
      'preview': instance.preview,
      'md5Image': instance.md5Image,
      'position': instance.position,
      'artist': instance.artist,
      'album': instance.album,
      'type': instance.type,
    };
