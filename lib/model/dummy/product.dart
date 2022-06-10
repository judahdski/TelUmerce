class Product {
  Product({
    required this.id,
    required this.name,
    required this.imgSrc,
    required this.amount,
    required this.desc,
    required this.price,
    required this.idCategory,
  });

  int id;
  String name;
  String imgSrc;
  int amount;
  String desc;
  double price;
  int idCategory;
}
