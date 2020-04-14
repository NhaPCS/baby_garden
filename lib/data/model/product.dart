class Product {
  String id;
  String shopId;
  String categoryId;
  String name;
  String price;
  String date;
  bool isFavorite;
  List<dynamic> image;

  Product(
      {this.id,
      this.shopId,
      this.categoryId,
      this.name,
      this.price,
      this.date,
      this.isFavorite,
      this.image});
}
