// lib/features/favourites/presentation/widgets/favourites_list.dart

import 'package:patahao/common/res/l10n.dart';
import 'package:patahao/features/favourites/presentation/bloc/favourites_bloc.dart';
import 'package:patahao/features/properties/data/models/property_search_response.dart';
import 'package:patahao/features/properties/presentation/widgets/property_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesList extends StatelessWidget {
  final List<PropertyResult> favourites;
  const FavouritesList({super.key, required this.favourites});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator.adaptive(
      onRefresh: () async {
        context.read<FavouritesBloc>().add(ListFavouritesEvent());
      },
      child: BlocBuilder<FavouritesBloc, FavouritesState>(
        builder: (context, state) {
          if (state is LoadingFavourites && favourites.isEmpty) {
            return Center(child: CircularProgressIndicator.adaptive());
          }

          if (state is LoadFavouritesError) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    state.error,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                SizedBox(height: 16),
                IconButton(
                  onPressed: () =>
                      context.read<FavouritesBloc>().add(ListFavouritesEvent()),
                  icon: Icon(Icons.replay_outlined),
                )
              ],
            );
          }

          if (favourites.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite_border, size: 64, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No favourites yet',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Start adding properties to your favourites!',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            );
          }

          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: favourites.length,
            padding: EdgeInsets.only(top: 20, bottom: 20),
            itemBuilder: (context, index) =>
                PropertyCard(property: favourites[index]),
          );
        },
      ),
    );
  }
}
