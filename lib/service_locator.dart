import 'package:get_it/get_it.dart';
import 'package:spotify/data/repository/auth/auth_repository_impl.dart';
import 'package:spotify/data/repository/song/song_respository_impl.dart';
import 'package:spotify/data/sources/auth/auth_firebase_service.dart';
import 'package:spotify/data/sources/song/song_firebase_service.dart';
import 'package:spotify/domain/repository/auth/auth.dart';
import 'package:spotify/domain/repository/song/song.dart';
import 'package:spotify/domain/usecases/auth/signin.dart';
import 'package:spotify/domain/usecases/auth/signup.dart';
import 'package:spotify/domain/usecases/song/add_or_remove_favorite_song.dart';
import 'package:spotify/domain/usecases/song/get_all_songs.dart';
import 'package:spotify/domain/usecases/song/get_new_songs.dart';
import 'package:spotify/domain/usecases/song/is_favorite_song.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  sl.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImpl());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  sl.registerSingleton<SignUpUserCase>(SignUpUserCase());
  sl.registerSingleton<SignInUserCase>(SignInUserCase());
  sl.registerSingleton<SongService>(SongFirebaseServiceImpl());
  sl.registerSingleton<SongsRepository>(SongRepositoryImpl());
  sl.registerSingleton<GetNewSongsUserCase>(GetNewSongsUserCase());
  sl.registerSingleton<GetAllSongsUserCase>(GetAllSongsUserCase());
  sl.registerSingleton<AddOrRemoveFavoriteSong>(AddOrRemoveFavoriteSong());
  sl.registerSingleton<IsFavoriteSong>(IsFavoriteSong());
}
