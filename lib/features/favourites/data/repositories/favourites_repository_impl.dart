// lib/features/favourites/data/repositories/favourites_repository_impl.dart

import 'package:patahao/core/errors/failures.dart';
import 'package:patahao/features/favourites/data/datasources/favourites_local_datasource.dart';
import 'package:patahao/features/favourites/domain/repositories/favourites_repository.dart';
import 'package:patahao/features/properties/data/models/property_search_response.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FavouritesRepository)
class FavouritesRepositoryImpl implements FavouritesRepository {
  final FavouritesLocalDatasource _localDatasource;

  FavouritesRepositoryImpl(this._localDatasource);

  @override
  Future<Either<Failure, List<PropertyResult>>> loadFavourites() async {
    try {
      final response = await _localDatasource.listFavourites();
      return Right(response);
    } catch (e) {
      return Left(GeneralFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PropertyResult>>> addFavourite(
      PropertyResult model) async {
    try {
      final favs = await _localDatasource.addFavourite(model);
      if (favs != null) return Right(favs);
      return Left(GeneralFailure(error: 'unableToAddToFavs'));
    } catch (e) {
      return Left(GeneralFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<PropertyResult>>> deleteFavourite(
      PropertyResult model) async {
    try {
      final favs = await _localDatasource.deleteFavourite(model);
      return Right(favs);
    } catch (e) {
      return Left(GeneralFailure(error: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> checkIfFav(PropertyResult model) async {
    try {
      return Right(await _localDatasource.checkIfFav(model));
    } catch (e) {
      return Left(GeneralFailure(error: e.toString()));
    }
  }
}
