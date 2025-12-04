// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'query_property_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QueryPropertyModel _$QueryPropertyModelFromJson(Map<String, dynamic> json) =>
    QueryPropertyModel(
      input: json['input'] as String?,
      city: json['city'] as String?,
      stateCode: json['state_code'] as String?,
      limit: (json['limit'] as num?)?.toInt(),
      offset: (json['offset'] as num?)?.toInt(),
      sort: json['sort'] as String?,
      propertyId: json['property_id'] as String?,
      bedsMin: (json['beds_min'] as num?)?.toInt(),
      bedsMax: (json['beds_max'] as num?)?.toInt(),
      bathsMin: (json['baths_min'] as num?)?.toInt(),
      priceMin: (json['price_min'] as num?)?.toInt(),
      priceMax: (json['price_max'] as num?)?.toInt(),
      sqftMin: (json['sqft_min'] as num?)?.toInt(),
      sqftMax: (json['sqft_max'] as num?)?.toInt(),
      propType: json['prop_type'] as String?,
    );

Map<String, dynamic> _$QueryPropertyModelToJson(QueryPropertyModel instance) =>
    <String, dynamic>{
      'input': instance.input,
      'city': instance.city,
      'state_code': instance.stateCode,
      'limit': instance.limit,
      'offset': instance.offset,
      'sort': instance.sort,
      'property_id': instance.propertyId,
      'beds_min': instance.bedsMin,
      'beds_max': instance.bedsMax,
      'baths_min': instance.bathsMin,
      'price_min': instance.priceMin,
      'price_max': instance.priceMax,
      'sqft_min': instance.sqftMin,
      'sqft_max': instance.sqftMax,
      'prop_type': instance.propType,
    };
