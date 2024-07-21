import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:spotify/data/models/song/song.dart';
import 'package:spotify/domain/entity/song/song.dart';

abstract class SongService {
  Future<Either> getNewSongs();
}

class SongFirebaseServiceImpl extends SongService {
  @override
  Future<Either> getNewSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('relaseDate', descending: true)
          .limit(3)
          .get();
      for (var song in data.docs) {
        songs.add(SongModel.fromJson(song.data()).toEntity());
      }
      return Right(songs);
    } on Exception catch (e) {
      return const Left('error occured during fetching new songs');
    }
  }
}
