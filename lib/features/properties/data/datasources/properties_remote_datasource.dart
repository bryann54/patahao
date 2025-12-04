import 'package:patahao/core/api_client/client/api_endpoints.dart';
import 'package:patahao/features/properties/data/models/query_property_model.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:patahao/core/api_client/client_provider.dart';

@lazySingleton
class PropertiesRemoteDatasource {
  // Inject the ClientProvider, which abstracts away the HTTP client (Dio)
  // and handles API key/host insertion from the environment configuration.
  final ClientProvider _clientProvider;

  PropertiesRemoteDatasource(this._clientProvider);

  // AutoComplete endpoint for location search
  Future<dynamic> autoComplete(String input) async {
    try {
      // Use the injected client's GET method
      return await _clientProvider.get(
        // Pass the endpoint path as the URL parameter
        url: ApiEndpoints.propertiesAutoComplete,
        // Pass the query parameters
        query: {'input': input},
      );
    } catch (e) {
      if (kDebugMode) {
        debugPrint('autoComplete error: $e');
      }
      rethrow;
    }
  }

  // List Properties (Search)
  Future<dynamic> listProperties(QueryPropertyModel queryModel) async {
    try {
      final queryParams = queryModel.toJson();

      if (kDebugMode) {
        debugPrint('Query Params: $queryParams');
      }

      // Use the injected client's GET method
      return await _clientProvider.get(
        // Pass the endpoint path
        url: ApiEndpoints.propertiesList,
        // Pass query parameters. Values are mapped to strings for safety.
        query: queryParams.map(
          (key, value) => MapEntry(key, value.toString()),
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        debugPrint('listProperties error: $e');
      }
      rethrow;
    }
  }

  // Get Property Detail
  Future<dynamic> getPropertyDetail(String propertyId) async {
    try {
      // Use the injected client's GET method
      return await _clientProvider.get(
        // Pass the endpoint path
        url: ApiEndpoints.propertiesDetail,
        // Pass the property ID query parameter
        query: {'property_id': propertyId},
      );
    } catch (e) {
      if (kDebugMode) {
        debugPrint('getPropertyDetail error: $e');
      }
      rethrow;
    }
  }
}
