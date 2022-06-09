import '../model/dummy/category.dart';

class CategoriesDatasource {
  List<Categories> getAllCategories() {
    return [
      Categories(id: 1, name: 'Aksesoris'),
      Categories(id: 2, name: 'Alat Tulis'),
    ];
  }
}
