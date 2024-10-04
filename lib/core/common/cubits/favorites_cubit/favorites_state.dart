part of 'favorites_cubit.dart';

class FavoritesState extends Equatable {
  final List<ZikerModel> favorites;

  const FavoritesState({required this.favorites});

  @override
  List<Object> get props => [favorites];
}
