import 'package:telumerce/model/dummy/product.dart';

class ProductDatasource {
  static List<Product> getAllProductsDummy() {
    return [
      Product(id: 1,
          name: 'Gantungan Kunci Telkom Univeristy', amount: 150,
          imgSrc: '',
          desc: 'Gantungan Kunci berisi logo Telkom University.',
          price: 12000.0, idCategory: 1),
      Product(id: 2,
          name: 'Ikat Pinggang Telkom Univeristy', amount: 200,
          imgSrc: '',
          desc: 'Ikat pinggang berupa pita fleksibel.',
          price: 15000.0, idCategory: 1),
      Product(id: 3,
          name: 'Sticker Telkom Univeristy', amount: 200,
          imgSrc: '',
          desc: 'Stiker Telkom Univeristy ini berupa lembaran kertas kecil atau plastik yang dapat ditempelkan.',
          price: 1000.0, idCategory: 1),
      Product(id: 4,
          name: 'Buku Tulis', amount: 120,
          imgSrc: '',
          desc: 'Buku tulis BigBoss (ukuran 250x180 mm, Kertas 700 GSM, Isi 10 buku)',
          price: 58000.0, idCategory: 2),
      Product(id: 5,
          name: 'Pulpen Gel', amount: 200,
          imgSrc: '',
          desc: 'Buku tulis BigBoss (ukuran 250x180 mm, Kertas 700 GSM, Isi 10 buku)Pulpen gel berisi logo Telkom University , terdiri berbagai macam warna yaitu Black/Blue/Red, ukuran produk: 14.4 cm X 1.5 cm, Diameter 1 cm.',
          price: 25000.0, idCategory: 2),
    ];
  }
}