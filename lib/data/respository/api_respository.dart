import 'package:bubu_market/constants/path_util.dart';
import 'package:bubu_market/extension/rx_lift_error.dart';
import 'package:bubu_market/models/collection_list.dart';
import 'package:bubu_market/models/products.dart';
import 'package:dio/dio.dart';

import '../network/api_client.dart';
import '../sharedpref/shared_preferences_helper.dart';

class ApiRepository {
  final ApiService apiService;
  final SharedPreferencesHelper preferencesHelper;

  ApiRepository({required this.apiService, required this.preferencesHelper});

  Future<List<Products>> getProducts() {
    return apiService
        .get(path: PathUtil.productsPath())
        .asStream()
        .liftError()
        .map((Response response) {
      return ProductList.fromJson(response.data).products ?? [];
    }).first;
  }

 Future<List<Products>> getProductsByCollectionId(int id) {
    return apiService
        .get(path: PathUtil.productsPath(), params: {"collection_id": id})
        .asStream()
        .liftError()
        .map((Response response) {
          return ProductList.fromJson(response.data).products ?? [];
        })
        .first;
  }

  Future<Collection?> getCollectionsById(int id) {
     return apiService
        .get(path: PathUtil.collectionsPathById(id))
        .asStream()
        .liftError()
        .map((Response response) {
      return CollectionList.fromJson(response.data).collection;
    }).first;
  }
 
}
