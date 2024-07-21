import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotify/domain/entity/song/song.dart';

class SongModel {
  SongModel({
    required String artist,
    required num duration,
    required Timestamp releaseDate,
    required String title,
  }) {
    _artist = artist;
    _duration = duration;
    _releaseDate = releaseDate;
    _title = title;
  }

  SongModel.fromJson(dynamic json) {
    _artist = json['artist'];
    _duration = json['duration'];
    _releaseDate = json['releaseDate'];
    _title = json['title'];
  }

  String? _artist;
  num? _duration;
  Timestamp? _releaseDate;
  String? _title;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['artist'] = _artist;
    map['duration'] = _duration;
    map['releaseDate'] = _releaseDate;
    map['title'] = _title;
    return map;
  }

  SongEntity toEntity() {
    return SongEntity(
      title: _title!,
      artist: _artist!,
      duration: _duration!,
      releaseDate: _releaseDate!,
    );
  }
}
