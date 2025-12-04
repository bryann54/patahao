import 'package:patahao/common/utils/date_utils.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patahao/features/hotels/data/models/query_hotel_model.dart';

void main() {
  test('QueryHotelModel should serialize and deserialize correctly', () {
    final queryHotelModel = QueryHotelModel(
      engine: 'engine',
      q: 'query',
      gl: 'US',
      hl: 'en',
      currency: 'USD',
      checkInDate: formatDateObj(getCurrentDateTime()),
      checkOutDate: formatDateObj(addDays(1, getCurrentDateTime())),
    );
    final json = queryHotelModel.toJson();
    final newModel = QueryHotelModel.fromJson(json);

    expect(newModel.toJson().toString(), queryHotelModel.toJson().toString());
  });
}
