// lib/features/favourites/domain/repositories/favourites_repository.dart

import 'package:patahao/core/errors/failures.dart';
import 'package:patahao/features/properties/data/models/property_search_response.dart';
import 'package:dartz/dartz.dart';

abstract class FavouritesRepository {
  Future<Either<Failure, List<PropertyResult>>> loadFavourites();
  Future<Either<Failure, List<PropertyResult>>> addFavourite(
      PropertyResult model);
  Future<Either<Failure, List<PropertyResult>>> deleteFavourite(
      PropertyResult model);
  Future<Either<Failure, bool>> checkIfFav(PropertyResult model);
}
