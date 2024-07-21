import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/domain/entity/song/song.dart';
import 'package:spotify/presentation/home/pages/bloc/new_songs_cubit.dart';
import 'package:spotify/presentation/home/pages/bloc/new_songs_state.dart';

class NewSongs extends StatelessWidget {
  const NewSongs({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NewSongsCubit()..getNewSongs(),
      child: SizedBox(
          height: 200,
          child: BlocBuilder<NewSongsCubit, NewSongsState>(
            builder: (context, state) {
              if (state is NewSongsLoaded) {
                return songs(state.songs);
              }
              if (state is NewSongsLoading) {
                return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator());
              }
              return Container();
            },
          )),
    );
  }

  Widget songs(List<SongEntity> songs) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return SizedBox(
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(songs[index].coverUrl))),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                songs[index].title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                songs[index].artist,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 16,
      ),
      itemCount: songs.length,
    );
  }
}
