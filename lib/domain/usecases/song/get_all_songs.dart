import 'package:dartz/dartz.dart';
import 'package:spotify/domain/repository/song/song.dart';

import '../../../core/config/usercases.dart';
import '../../../service_locator.dart';

class GetAllSongsUserCase implements UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return sl<SongsRepository>().getAllSongs();
  }
}
