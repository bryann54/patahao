// lib/features/properties/domain/usecases/list_properties_usecase.dart

import 'package:patahao/common/helpers/base_usecase.dart';
import 'package:patahao/core/errors/failures.dart';
import 'package:patahao/features/properties/data/models/query_property_model.dart';
import 'package:patahao/features/properties/data/models/property_search_response.dart';
import 'package:patahao/features/properties/domain/repositories/properties_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ListPropertiesUsecase
    implements UseCase<PropertySearchResponse, GetPropertiesParams> {
  final PropertiesRepository _repo;

  ListPropertiesUsecase(this._repo);

  @override
  Future<Either<Failure, PropertySearchResponse>> call(
      GetPropertiesParams params) async {
    return await _repo.listProperties(QueryPropertyModel(
      city: params.city,
      stateCode: params.stateCode,
      limit: params.limit ?? 20,
      offset: params.offset ?? 0,
      sort: params.sort ?? 'relevance',
      bedsMin: params.bedsMin,
      bedsMax: params.bedsMax,
      bathsMin: params.bathsMin,
      priceMin: params.priceMin,
      priceMax: params.priceMax,
      sqftMin: params.sqftMin,
      sqftMax: params.sqftMax,
      propType: params.propType,
    ));
  }
}
