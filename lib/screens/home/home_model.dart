import 'package:bubu_market/constants/key_util.dart';
import 'package:bubu_market/data/respository/api_respository.dart';
import 'package:bubu_market/main.dart';
import 'package:bubu_market/models/collection_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/products.dart';

final homeProvider = ChangeNotifierProvider<HomeViewModel>((ref) {
  return HomeViewModel(apiRepository: ref.read(apiRepository));
});

class HomeViewModel with ChangeNotifier {
  final ApiRepository apiRepository;
  List<Products> productList = [];

  HomeViewModel({required this.apiRepository}) {
    apiRepository.getProducts().then((value) {
      productList = value;
      notifyListeners();
    }, onError: (e) {
      if (kDebugMode) {
        print(e);
      }
    });
  }
}

final homeBannerListProvider = FutureProvider((ref) {
  return Future.wait(KeyUtil.homeBanner
      .map((e) => ref.read(apiRepository).getCollectionsById())
      .toList());
});

final homeBannerIndicator = StateProvider((ref) => 0);

