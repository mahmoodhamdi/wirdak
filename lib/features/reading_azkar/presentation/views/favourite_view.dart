import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wirdak/core/common/cubits/favorites_cubit/favorites_cubit.dart';
import 'package:wirdak/core/common/widgets/custom_app_bar.dart';
import 'package:wirdak/core/common/widgets/ziker_card.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'المفضلة'),
      body: BlocBuilder<FavoritesCubit, FavoritesState>(
        builder: (context, state) {
          if (state.favorites.isEmpty) {
            return const Center(child: Text('لا يوجد مفضلة'));
          }
          return ListView.builder(
            itemCount: state.favorites.length,
            itemBuilder: (context, index) {
              return ZikerCard(isFavorite: true, ziker: state.favorites[index]);
            },
          );
        },
      ),
    );
  }
}
