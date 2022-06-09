import 'package:telumerce/model/dummy/product.dart';

class ProductDatasource {
  List<Product> getAllProducts() {
    return [
      Product(id: 1,
          name: 'Gantungan Kunci Telkom Univeristy', amount: 150,
          desc: 'Gantungan Kunci berisi logo Telkom University.',
          price: 12000.0, idCategory: 1),
      Product(id: 2,
          name: 'Ikat Pinggang Telkom Univeristy', amount: 200,
          desc: 'Ikat pinggang berupa pita fleksibel.',
          price: 15000.0, idCategory: 2),
    ];
  }
}