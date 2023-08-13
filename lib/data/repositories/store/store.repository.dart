import 'package:medlem/data/data.dart';

class StoreRepository {
  StoreRepository({StoreAPI? storeAPI}) : _storeAPI = storeAPI ?? StoreAPI();

  final StoreAPI _storeAPI;

  Future<StoreLocationModel> searchStores(dynamic queryParam) async {
    try {
      final res = await _storeAPI.searchStores(queryParam);
      return StoreLocationModel.fromJson(res);
    } catch (e) {
      rethrow;
    }
  }
}
