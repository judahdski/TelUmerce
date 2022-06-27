import '../model/categori.dart';
import '../services/product/all_category_service.dart';

Future<List> _getAllCategories() async {
  final List categories = [];
  final response = await getCategoriesService();

  if (response.isSuccessful) {
    categories.addAll(response.data as List<Categori>);
  } else {}

  return categories;
}

Future<String> getCategoryNameController(int idCategory) async {
  var categories = await _getAllCategories();
  var categoryName = '';

  for (var categori in categories) {
    if (categori.id == idCategory) {
      categoryName = categori.nameCategory;
    }
  }

  return categoryName;
}