
import 'package:bubu_market/constants/key_util.dart';
import 'package:bubu_market/constants/path.dart';

class PathUtil {
  static Paths root() {
    return Paths.fromPath("");
  }

  static Paths productsPath() {
    return root().child(KeyUtil.products);
  }

  static Paths productsPathById(int id) {
    return productsPath().child(id.toString());
  }

  static Paths productsCountPath() {
    return productsPath().child(KeyUtil.count);
  }

  static Paths customCollectionsPath() {
    return root().child(KeyUtil.customCollections);
  }

  static Paths collectsPath() {
    return root().child(KeyUtil.collects);
  }

  static Paths collectionsPathById() {
    return root().child(KeyUtil.collections);
  }

  static Paths collectionsProductsPathById(int id) {
    return root()
        .child(KeyUtil.collections)
        .child(id.toString())
        .child(KeyUtil.products);
  }
}
