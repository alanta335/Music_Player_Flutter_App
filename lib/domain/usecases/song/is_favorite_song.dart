import 'package:spotify/domain/repository/song/song.dart';

import '../../../core/config/usercases.dart';
import '../../../service_locator.dart';

class IsFavoriteSong implements UseCase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await sl<SongsRepository>().isFavoriteSong(params!);
  }
}
