part of 'ziker_cubit.dart';
class ZikerState extends Equatable {
  final int count;
  final bool isFavorite;

  const ZikerState({required this.count, this.isFavorite = false});

  @override
  List<Object> get props => [count, isFavorite];
}

