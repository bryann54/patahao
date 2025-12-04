import 'package:patahao/common/helpers/base_usecase.dart';
import 'package:patahao/core/errors/failures.dart';
import 'package:patahao/features/favourites/domain/repositories/favourites_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:patahao/features/properties/data/models/property_search_response.dart';

@lazySingleton
class LoadFavouritesUsecase implements UseCase<List<PropertyResult>, NoParams> {
  final FavouritesRepository _repo;

  LoadFavouritesUsecase(this._repo);

  @override
  Future<Either<Failure, List<PropertyResult>?>> call(NoParams params) async {
    return await _repo.loadFavourites();
  }
}
