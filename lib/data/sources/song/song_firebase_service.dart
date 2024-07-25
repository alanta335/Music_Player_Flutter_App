import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotify/data/models/song/song.dart';
import 'package:spotify/domain/entity/song/song.dart';
import 'package:spotify/domain/usecases/song/is_favorite_song.dart';
import 'package:spotify/service_locator.dart';

abstract class SongService {
  Future<Either> getNewSongs();

  Future<Either> getAllSongs();

  Future<Either> addOrRemoveFavoriteSong(String songId);

  Future<bool> isFavoriteSong(String songId);
}

class SongFirebaseServiceImpl extends SongService {
  @override
  Future<Either> getNewSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .limit(3)
          .get();
      for (var song in data.docs) {
        SongModel songModel = SongModel.fromJson(song.data());
        String songId = song.reference.id;
        bool isFavorite = await sl<IsFavoriteSong>().call(params: songId);
        songModel.isFavorite = isFavorite;
        songModel.songId = songId;
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } on Exception catch (e) {
      return const Left('error occured during fetching new songs');
    }
  }

  @override
  Future<Either> getAllSongs() async {
    try {
      List<SongEntity> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releaseDate', descending: true)
          .get();
      for (var song in data.docs) {
        SongModel songModel = SongModel.fromJson(song.data());
        String songId = song.reference.id;
        bool isFavorite = await sl<IsFavoriteSong>().call(params: songId);
        songModel.isFavorite = isFavorite;
        songModel.songId = songId;
        songs.add(songModel.toEntity());
      }
      return Right(songs);
    } on Exception catch (e) {
      return const Left('error occured during fetching new songs');
    }
  }

  @override
  Future<Either> addOrRemoveFavoriteSong(String songId) async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      late bool isFavorite;
      String userId = firebaseAuth.currentUser!.uid;
      QuerySnapshot favoriteSongs = await firebaseFirestore
          .collection('Users')
          .doc(userId)
          .collection('Favorites')
          .where('songId', isEqualTo: songId)
          .get();
      if (favoriteSongs.docs.isNotEmpty) {
        await favoriteSongs.docs.first.reference.delete();
        isFavorite = false;
      } else {
        await firebaseFirestore
            .collection('Users')
            .doc(userId)
            .collection('Favorites')
            .add({'songId': songId, 'addedDate': Timestamp.now()});
        isFavorite = true;
      }
      return right(isFavorite);
    } on Exception catch (e) {
      return const Left('An error occurred');
    }
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      String userId = firebaseAuth.currentUser!.uid;
      QuerySnapshot favoriteSongs = await firebaseFirestore
          .collection('Users')
          .doc(userId)
          .collection('Favorites')
          .where('songId', isEqualTo: songId)
          .get();
      if (favoriteSongs.docs.isNotEmpty) {
        return false;
      } else {
        return true;
      }
    } on Exception catch (e) {
      return false;
    }
  }
}
