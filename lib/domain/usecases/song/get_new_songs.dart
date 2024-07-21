import 'package:dartz/dartz.dart';
import 'package:spotify/core/config/usercases.dart';
import 'package:spotify/data/repository/song/song_respository_impl.dart';

import '../../../service_locator.dart';

class GetNewSongsUserCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return sl<SongRepositoryImpl>().getNewSongs();
  }
}
