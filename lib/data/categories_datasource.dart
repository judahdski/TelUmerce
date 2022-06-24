import '../model/dummy/category.dart';

class CategoriesDatasource {
  static List<Categories> getAllCategoriesDummy() {
    return [
      Categories(id: 1, name: 'Baju'),
    ];
  }
}
