import 'package:patahao/common/helpers/base_usecase.dart';
import 'package:patahao/core/storage/storage_preference_manager.dart';
import 'package:patahao/features/hotels/data/models/search_response.dart';
import 'package:patahao/features/hotels/domain/usecases/list_hotels_usecase.dart';
import 'package:patahao/features/hotels/presentation/bloc/hotels_bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'hotels_bloc_test.mocks.dart';

@GenerateMocks([ListHotelsUsecase, SharedPreferencesManager])
void main() {
  late MockListHotelsUsecase mockUsecase;
  late MockSharedPreferencesManager mockSharedPreferencesManager;
  late HotelsBloc bloc;

  setUp(() {
    mockUsecase = MockListHotelsUsecase();
    mockSharedPreferencesManager = MockSharedPreferencesManager();
    when(mockSharedPreferencesManager.getString('language'))
        .thenAnswer((_) => 'en');
    bloc = HotelsBloc(mockUsecase, mockSharedPreferencesManager);
  });
  test('HotelsBloc should emit correct states', () {
    final params = GetHotelsParams(
      checkInDate: '2024-12-28',
      checkOutDate: '2024-12-29',
    );

    final expectedResponse = SearchResponse(
      properties: [],
      pagination:
          SerpApiPagination(currentFrom: 1, currentTo: 10, nextPageToken: 'TE'),
    );

    when(mockUsecase.call(params))
        .thenAnswer((_) async => Right(expectedResponse));

    bloc.add(ListHotelsEvent(params: params));

    expectLater(
      bloc.stream,
      emitsInOrder([
        isA<HotelsLoadingState>(),
        isA<ListHotelsSuccess>(),
      ]),
    );
  });
}
