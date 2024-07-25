import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/domain/entity/song/song.dart';

class SongModel {
  SongModel({
    required String artist,
    required num duration,
    required Timestamp releaseDate,
    required String title,
    required String coverUrl,
    required String songUrl,
    required bool isFavorite,
    required String songId,
  }) {
    artist = artist;
    duration = duration;
    releaseDate = releaseDate;
    title = title;
    coverUrl = coverUrl;
    songUrl = songUrl;
    isFavorite = isFavorite;
    songId = songId;
  }

  SongModel.fromJson(dynamic json) {
    artist = json['artist'];
    duration = json['duration'];
    releaseDate = json['releaseDate'];
    title = json['title'];
    coverUrl = json['coverUrl'];
    songUrl = json['songUrl'];
  }

  String? artist;
  num? duration;
  Timestamp? releaseDate;
  String? title;
  String? coverUrl;
  String? songUrl;
  bool? isFavorite;
  String? songId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['artist'] = artist;
    map['duration'] = duration;
    map['releaseDate'] = releaseDate;
    map['title'] = title;
    map['coverUrl'] = coverUrl;
    map['songUrl'] = songUrl;
    return map;
  }

  SongEntity toEntity() {
    return SongEntity(
      title: title!,
      artist: artist!,
      duration: duration!,
      releaseDate: releaseDate!,
      coverUrl: coverUrl!,
      songUrl: songUrl!,
      isFavorite: isFavorite!,
      songId: songId!,
    );
  }
}
