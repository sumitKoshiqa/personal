class ApiEndPoints{
  static const String baseUrl = "http://143.110.182.212:4322/";
  // static const String baseUrl = "https://e2a8-103-200-85-57.ngrok.io/";
  // static const String baseUrl = "http://192.168.1.44:4322/";


  static const String sendOTP = "${baseUrl}api/sendOtp";
  static const String verifyOTP = "${baseUrl}api/verifyOtp";
  static const String updateDeviceToken = "${baseUrl}api/updateDevicetoken";
  static const String getHomeData = "${baseUrl}api/home/getHomeData";
  static const String uploadImage = "${baseUrl}upload/uploadImage";
  static const String updateProfile = "${baseUrl}api/user/updateUserProfile";
  static const String getUserProfile = "${baseUrl}api/user/getUserProfile";
  static const String productHome = "${baseUrl}api/product/getProductPageData";
  static const String modifyCart = "${baseUrl}api/product/addToCart";
  static const String fetchCart = "${baseUrl}api/product/getAllCartItems";
  static const String getCheckout = "${baseUrl}api/product/getCheckoutDetail";
  static const String getMyOrders = "${baseUrl}api/product/productHistory";
  static const String cancelOrder = "${baseUrl}api/product/cancelOrder";
  static const String returnOrder = "${baseUrl}api/product/returnOrder";
  static const String getProductDetail = "${baseUrl}api/product/getProductDetail";
  static const String modifyWishList = "${baseUrl}api/product/addRemoveWishlist";
  static const String getWishList = "${baseUrl}api/product/getAllWishlist";
  static const String getCoupons = "${baseUrl}api/product/getAllCoupons";
  static const String applyCoupon = "${baseUrl}api/product/applyCouponCode";
  static const String getOrderDetail = "${baseUrl}api/product/orderDetail";
  static const String searchProducts = "${baseUrl}api/product/getSearchProduct";
  static const String getAllAddress = "${baseUrl}api/address/getAllAddresses";
  static const String saveAddress = "${baseUrl}api/address/addAddress";
  static const String editAddress = "${baseUrl}api/address/updateAddress";
  static const String deleteAddress = "${baseUrl}api/address/deleteAddresses";
  static const String setDefaultAddress = "${baseUrl}api/address/setDefaultAddress";
  static const String getPaymentIntent = "${baseUrl}api/payment/createPaymentIntent";
  static const String getBrands = "${baseUrl}api/product/getProductsBrand";
  static const String getProductType = "${baseUrl}api/product/getProductsType";




  static const String getAllUserBooking = "${baseUrl}api/doctor/getUsersAllBooking";
  static const String getAllDoctor = "${baseUrl}api/home/getAllDr";
  static const String getDoctorDetail = "${baseUrl}api/doctor/getDrProfileOnBooking";
  static const String getDoctorSlots = "${baseUrl}api/doctor/getDatesArray";

}