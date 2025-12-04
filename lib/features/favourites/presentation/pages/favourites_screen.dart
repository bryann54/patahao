// lib/features/favourites/presentation/pages/favourites_screen.dart

import 'package:auto_route/auto_route.dart';
import 'package:patahao/common/res/l10n.dart';
import 'package:patahao/features/favourites/presentation/bloc/favourites_bloc.dart';
import 'package:patahao/features/favourites/presentation/widgets/favourites_list.dart';
import 'package:patahao/features/properties/data/models/property_search_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final List<PropertyResult> favs = [];

  @override
  void initState() {
    super.initState();
    context.read<FavouritesBloc>().add(ListFavouritesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourites'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: BlocListener<FavouritesBloc, FavouritesState>(
          listener: (context, state) {
            if (state is AddFavouritesError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.error),
                  backgroundColor: Colors.red,
                ),
              );
            } else if (state is LoadFavouritesSuccess ||
                state is AddFavouritesSuccess ||
                state is DeleteFavouritesSuccess) {
              setState(() {
                favs.clear();
                if (state is LoadFavouritesSuccess) {
                  favs.addAll(state.favs);
                } else if (state is AddFavouritesSuccess) {
                  favs.addAll(state.favs);
                } else if (state is DeleteFavouritesSuccess) {
                  favs.addAll(state.favs);
                }
              });
            }
          },
          child: FavouritesList(favourites: favs),
        ),
      ),
    );
  }
}
