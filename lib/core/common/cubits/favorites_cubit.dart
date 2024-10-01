import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:wirdak/core/common/models/azkar_model.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  // Local variable to store favorites
  final List<ZikerModel> _favorites = [];

  FavoritesCubit() : super(const FavoritesState(favorites: []));

  void addToFavorites(ZikerModel ziker) {
    if (!_favorites.contains(ziker)) {
      _favorites.add(ziker);
      print('Added to favorites: ${ziker.id}');
      print('Current favorites: ${_favorites.map((e) => e.id)}');
      emit(FavoritesState(
          favorites: List.from(_favorites))); // Emit updated state
    } else {
      print('Ziker already in favorites: ${ziker.id}');
    }
  }

  void removeFromFavorites(ZikerModel ziker) {
    if (_favorites.remove(ziker)) {
      print('Removed from favorites: ${ziker.id}');
      emit(FavoritesState(
          favorites: List.from(_favorites))); // Emit updated state
    } else {
      print('Ziker not found in favorites: ${ziker.id}');
    }
  }
}
