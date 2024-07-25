import 'package:dartz/dartz.dart';
import 'package:spotify/domain/repository/song/song.dart';

import '../../../core/config/usercases.dart';
import '../../../service_locator.dart';

class AddOrRemoveFavoriteSong implements UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await sl<SongsRepository>().addOrRemoveFavoriteSong(params!);
  }
}
