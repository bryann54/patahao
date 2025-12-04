import 'package:patahao/common/helpers/base_usecase.dart';
import 'package:patahao/core/errors/failures.dart';
import 'package:patahao/features/favourites/domain/repositories/favourites_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:patahao/features/properties/data/models/property_search_response.dart';

@lazySingleton
class DeleteFavouriteUsecase
    implements UseCase<List<PropertyResult>, PropertyResult> {
  final FavouritesRepository _repo;

  DeleteFavouriteUsecase(this._repo);

  @override
  Future<Either<Failure, List<PropertyResult>?>> call(
      PropertyResult params) async {
    return await _repo.deleteFavourite(params);
  }
}


