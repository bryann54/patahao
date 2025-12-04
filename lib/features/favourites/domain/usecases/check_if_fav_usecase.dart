import 'package:patahao/common/helpers/base_usecase.dart';
import 'package:patahao/core/errors/failures.dart';
import 'package:patahao/features/favourites/domain/repositories/favourites_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:patahao/features/properties/data/models/property_search_response.dart';

@lazySingleton
class CheckIfFavUsecase implements UseCase<bool, PropertyResult> {
  final FavouritesRepository _repo;

  CheckIfFavUsecase(this._repo);

  @override
  Future<Either<Failure, bool?>> call(PropertyResult params) async {
    return await _repo.checkIfFav(params);
  }
}
