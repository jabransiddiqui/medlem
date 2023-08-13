import '/core/core.dart';

class StoreAPI {
  StoreAPI();

  Future<dynamic> searchStores(dynamic queryParam) async {
    try {
      return await HTTP.instance
          .iGet(ApiRoutes.searchStores, queryParameters: queryParam);
    } catch (e) {
      rethrow;
    }
  }
}
