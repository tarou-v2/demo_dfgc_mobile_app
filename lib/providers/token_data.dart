import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../services/token_data.dart';

// TokenDataService を提供する Provider
final tokenDataServiceProvider = Provider<TokenDataService>((ref) {
  return TokenDataService();
});

// トークンデータを取得する FutureProvider
final tokenDataProvider = FutureProvider.family<Map<String, dynamic>,
    ({String network, String tokenAddress})>(
  (ref, params) async {
    final tokenDataService = ref.read(tokenDataServiceProvider);
    return tokenDataService.fetchTokenData(params.network, params.tokenAddress);
  },
);
