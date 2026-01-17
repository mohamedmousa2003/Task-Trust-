const String baseURL = "https://dushkaburger.com/wp-json";
class EndPoints{

  static const String getAllCategories = "$baseURL/custom-api/v1/categories";
  static const String getORAddCart = "$baseURL/guestcart/v1/cart";
  static const String guestId = "guest_696a881f274b4";

  static const String getAllBrands = "$baseURL/api/v1/brands";
  static String subCategories(String id) {
    return '$baseURL/api/v1/categories/$id/subcategories';
  }
  static const String cart='$baseURL/api/v1/cart';

  static const String getAllProducts='$baseURL/api/v1/products';

}