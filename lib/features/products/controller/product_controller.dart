import 'package:get/get.dart';
import 'package:product_cart_app/features/products/model/product_model.dart';
import 'package:product_cart_app/features/products/repository/product_api.dart';

class ProductController extends GetxController {
  final ProductRepository _repository = ProductRepository();

  final loading = true.obs;
  final products = <Product>[].obs;
  final searchedProducts = <Product>[].obs;
  final selectedCategory = ''.obs;
  final productById = Rxn<Product>();
  var searchValue = ''.obs;

  bool get isLoading => loading.value;
  Product? get currentProduct => productById.value;

  void setSearchValue(String val) {
    searchValue.value = val;
    filterProducts();
  }

  void setProducts(List<Product> products) {
    this.products.assignAll(products);
    filterProducts();
  }

  Future<void> filterByCategory(String category) async {
    loading.value = true;
    selectedCategory.value = category.toLowerCase();

    final List<Product>? response = category.isEmpty
        ? await _repository.getProductList()
        : await _repository.getProductsByCategory(selectedCategory.value);

    products.assignAll(response ?? <Product>[]);
    filterProducts();
    loading.value = false;
    update();
  }

  Future<void> filterProducts() async {
    final String query = searchValue.value.trim().toLowerCase();

    if (query.isEmpty) {
      searchedProducts.assignAll(products);
    } else {
      searchedProducts.assignAll(
        products.where((product) {
          final String title = (product.title ?? '').toLowerCase();
          return title.contains(query);
        }),
      );
    }

    update();
  }

  Future<void> getProductList() async {
    loading.value = true;
    selectedCategory.value = '';
    products.assignAll(await _repository.getProductList() ?? []);
    filterProducts();
    loading.value = false;
    update();
  }

  Future<void> getProductById(int id) async {
    loading.value = true;
    productById.value = null;

    final Product? response = await _repository.getProductbyID(id);
    
    productById.value = response;
    loading.value = false;
    update();
  }
}
