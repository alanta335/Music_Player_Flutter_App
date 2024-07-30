import 'package:spotify/domain/entity/song/song.dart';

abstract class NewSongsState {}

class NewSongsLoading extends NewSongsState {}

class NewSongsLoaded extends NewSongsState {
  final List<SongEntity> songs;

  NewSongsLoaded({required this.songs});
}

class NewSongsLoadFailuer extends NewSongsState {}
