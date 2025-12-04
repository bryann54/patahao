import 'package:patahao/features/hotels/data/datasources/hotels_remote_datasource.dart';
import 'package:patahao/features/hotels/data/models/query_hotel_model.dart';
import 'package:patahao/features/hotels/data/models/search_response.dart';
import 'package:patahao/features/hotels/data/repositories/hotels_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'hotels_repository_impl_test.mocks.dart';

@GenerateMocks([HotelsRemoteDatasource])
void main() {
  late MockHotelsRemoteDatasource mockDataSource;
  late HotelsRepositoryImpl repo;

  setUp(() {
    mockDataSource = MockHotelsRemoteDatasource();
    repo = HotelsRepositoryImpl(mockDataSource);
  });

  test('returns SearchResponse for valid query', () async {
    // Arrange
    final expectedQuery = QueryHotelModel(
      engine: 'engine',
      q: 'query',
      gl: 'US',
      hl: 'en',
      currency: 'USD',
      checkInDate: '2024-12-28',
      checkOutDate: '2024-12-29',
    );
    final expectedResponse = SearchResponse(
      properties: [],
      pagination:
          SerpApiPagination(currentFrom: 1, currentTo: 10, nextPageToken: 'TE'),
    ).toJson();

    when(mockDataSource.listHotels(expectedQuery))
        .thenAnswer((_) async => expectedResponse);

    // Act
    final result = await repo.listHotels(expectedQuery);

    // Assert
    expect(result.isRight(), true);
    verify(mockDataSource.listHotels(expectedQuery)).called(1);
    verifyNoMoreInteractions(mockDataSource);
  });
}
