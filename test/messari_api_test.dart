import 'package:flutter_test/flutter_test.dart';
import 'package:messari_api/api/responses/asset_response.dart';

import 'package:messari_api/messari_api.dart';

void main() {
  test('Can get asset', () async {
    // Bitcoin
    AssetResponse response = await MessariAPI.getAsset('bitcoin');
    expect(response.asset.symbol, "BTC");
    expect(response.asset.name, "Bitcoin");
    expect(response.asset.slug, "bitcoin");
  });
}
