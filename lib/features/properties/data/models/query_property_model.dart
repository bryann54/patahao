// lib/features/properties/data/models/query_property_model.dart

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'query_property_model.g.dart';

@JsonSerializable()
class QueryPropertyModel extends Equatable {
  final String? input; // For autocomplete
  final String? city;
  @JsonKey(name: 'state_code')
  final String? stateCode;
  final int? limit;
  final int? offset;
  final String? sort; // relevance, price_low, price_high, newest
  @JsonKey(name: 'property_id')
  final String? propertyId; // For detail endpoint

  // Filters
  @JsonKey(name: 'beds_min')
  final int? bedsMin;
  @JsonKey(name: 'beds_max')
  final int? bedsMax;
  @JsonKey(name: 'baths_min')
  final int? bathsMin;
  @JsonKey(name: 'price_min')
  final int? priceMin;
  @JsonKey(name: 'price_max')
  final int? priceMax;
  @JsonKey(name: 'sqft_min')
  final int? sqftMin;
  @JsonKey(name: 'sqft_max')
  final int? sqftMax;
  @JsonKey(name: 'prop_type')
  final String?
      propType; // single_family, condo, multi_family, mobile, land, farm, other

  const QueryPropertyModel({
    this.input,
    this.city,
    this.stateCode,
    this.limit,
    this.offset,
    this.sort,
    this.propertyId,
    this.bedsMin,
    this.bedsMax,
    this.bathsMin,
    this.priceMin,
    this.priceMax,
    this.sqftMin,
    this.sqftMax,
    this.propType,
  });

  factory QueryPropertyModel.fromJson(Map<String, dynamic> json) =>
      _$QueryPropertyModelFromJson(json);

  Map<String, dynamic> toJson() {
    final json = _$QueryPropertyModelToJson(this);
    // Remove null values
    json.removeWhere((key, value) => value == null);
    return json;
  }

  QueryPropertyModel copyWith({
    String? input,
    String? city,
    String? stateCode,
    int? limit,
    int? offset,
    String? sort,
    String? propertyId,
    int? bedsMin,
    int? bedsMax,
    int? bathsMin,
    int? priceMin,
    int? priceMax,
    int? sqftMin,
    int? sqftMax,
    String? propType,
  }) {
    return QueryPropertyModel(
      input: input ?? this.input,
      city: city ?? this.city,
      stateCode: stateCode ?? this.stateCode,
      limit: limit ?? this.limit,
      offset: offset ?? this.offset,
      sort: sort ?? this.sort,
      propertyId: propertyId ?? this.propertyId,
      bedsMin: bedsMin ?? this.bedsMin,
      bedsMax: bedsMax ?? this.bedsMax,
      bathsMin: bathsMin ?? this.bathsMin,
      priceMin: priceMin ?? this.priceMin,
      priceMax: priceMax ?? this.priceMax,
      sqftMin: sqftMin ?? this.sqftMin,
      sqftMax: sqftMax ?? this.sqftMax,
      propType: propType ?? this.propType,
    );
  }

  @override
  List<Object?> get props => [
        input,
        city,
        stateCode,
        limit,
        offset,
        sort,
        propertyId,
        bedsMin,
        bedsMax,
        bathsMin,
        priceMin,
        priceMax,
        sqftMin,
        sqftMax,
        propType,
      ];
}
