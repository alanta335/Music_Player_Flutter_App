import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/domain/entity/song/song.dart';

class SongModel {
  SongModel({
    required String artist,
    required num duration,
    required Timestamp releaseDate,
    required String title,
    required String coverUrl,
  }) {
    artist = artist;
    duration = duration;
    releaseDate = releaseDate;
    title = title;
    coverUrl = coverUrl;
  }

  SongModel.fromJson(dynamic json) {
    artist = json['artist'];
    duration = json['duration'];
    releaseDate = json['releaseDate'];
    title = json['title'];
    coverUrl = json['coverUrl'];
  }

  String? artist;
  num? duration;
  Timestamp? releaseDate;

  String? title;

  String? coverUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['artist'] = artist;
    map['duration'] = duration;
    map['releaseDate'] = releaseDate;
    map['title'] = title;
    map['coverUrl'] = coverUrl;
    return map;
  }

  SongEntity toEntity() {
    return SongEntity(
      title: title!,
      artist: artist!,
      duration: duration!,
      releaseDate: releaseDate!,
      coverUrl: coverUrl!,
    );
  }
}
