import 'package:ekikrit/Consumer/Shopping/Model/ProductModel.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../Model/ProductInventoryInfoModel.dart';
import '../Networking/ShoppingApi.dart';


class ProductController extends GetxController with StateMixin{

  Rxn<ProductModel> productModel = Rxn<ProductModel>();
  Rxn<ProductInventoryInfoModel> model = Rxn<ProductInventoryInfoModel>();
  RxList<ProductList> productList = <ProductList>[].obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  getProducts() async{
    isLoading.value = true;
    var data = await ShoppingApi().getProducts();
    if (data != null){
      productList.clear();
      ProductModel productModelTemp = data;
      productModel.value = productModelTemp;
      productList.assignAll(productModelTemp.data!);
    }
    isLoading.value = false;
  }

  getProductInventoryInfo({sellerProductId}) async{
    isLoading.value = true;
    var data = await ShoppingApi().getInventoryInfo(sellerProductId: sellerProductId);
    if (data != null){
      ProductInventoryInfoModel productInventoryInfoModel = data;
      model.value = productInventoryInfoModel;
      print("Inventory info ${model.value!.inventoryInfo.sellingPrice}");
    }
    isLoading.value = false;
  }

}