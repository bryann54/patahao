// lib/features/properties/domain/repositories/properties_repository.dart

import 'package:patahao/core/errors/failures.dart';
import 'package:patahao/features/properties/data/models/query_property_model.dart';
import 'package:patahao/features/properties/data/models/property_search_response.dart';
import 'package:dartz/dartz.dart';

abstract class PropertiesRepository {
  Future<Either<Failure, PropertySearchResponse>> autoComplete(String input);
  Future<Either<Failure, PropertySearchResponse>> listProperties(
      QueryPropertyModel query);
  Future<Either<Failure, PropertySearchResponse>> getPropertyDetail(
      String propertyId);
}
