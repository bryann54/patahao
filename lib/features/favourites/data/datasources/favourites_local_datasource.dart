// lib/features/favourites/data/datasources/favourites_local_datasource.dart

import 'dart:convert';

import 'package:patahao/core/storage/storage_preference_manager.dart';
import 'package:patahao/features/properties/data/models/property_search_response.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FavouritesLocalDatasource {
  final SharedPreferencesManager _sharedPreferencesManager;

  FavouritesLocalDatasource(this._sharedPreferencesManager);

  Future<List<PropertyResult>> listFavourites() async {
    final json = _sharedPreferencesManager
        .getString(SharedPreferencesManager.favourites);
    if (json == null) return [];
    return (jsonDecode(json) as List)
        .map((e) => PropertyResult.fromJson(e))
        .toList();
  }

  Future<List<PropertyResult>?> addFavourite(PropertyResult model) async {
    final favs = await listFavourites();
    final index =
        favs.indexWhere((element) => element.propertyId == model.propertyId);
    if (index != -1) return null; // Already exists

    final newFavs = [...favs, model];
    _sharedPreferencesManager.putString(SharedPreferencesManager.favourites,
        jsonEncode(newFavs.map((e) => e.toJson()).toList()));
    return newFavs;
  }

  Future<List<PropertyResult>> deleteFavourite(PropertyResult model) async {
    final favs = await listFavourites();
    final newFavs = favs
        .where((element) => element.propertyId != model.propertyId)
        .toList();
    _sharedPreferencesManager.putString(SharedPreferencesManager.favourites,
        jsonEncode(newFavs.map((e) => e.toJson()).toList()));
    return newFavs;
  }

  Future<bool> checkIfFav(PropertyResult model) async {
    final favs = await listFavourites();
    final index =
        favs.indexWhere((element) => element.propertyId == model.propertyId);

    return index != -1;
  }
}
