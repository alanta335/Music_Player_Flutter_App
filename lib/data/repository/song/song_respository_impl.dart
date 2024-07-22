import 'package:dartz/dartz.dart';
import 'package:spotify/data/sources/song/song_firebase_service.dart';
import 'package:spotify/domain/repository/song/song.dart';

import '../../../service_locator.dart';

class SongRepositoryImpl extends SongsRepository {
  @override
  Future<Either> getNewSongs() async {
    return await sl<SongService>().getNewSongs();
  }

  @override
  Future<Either> getAllSongs() async {
    return await sl<SongService>().getAllSongs();
  }
}
