import 'package:flutter/material.dart';

class Flower {
  final String nama;
  final String harga;
  final String deskripsi;
  final String gambarUrl;
  final double rating;

  Flower({required this.nama, required this.harga, required this.deskripsi, required this.gambarUrl, required this.rating, });
}
  List<Flower> flowerItems = [
  Flower(nama: 'Mawar', harga: '300.000', gambarUrl: 'https://i.pinimg.com/564x/79/c5/dc/79c5dc47535f09dec6034b5fad91deab.jpg', deskripsi: 'Mawar hadir dengan beberapa varian warna yaitu mawar merah,mawar putih, dan juga mawar pink', rating: 4.9),
 Flower(nama: 'Lili', harga: '50.000', gambarUrl: 'https://i.pinimg.com/564x/d3/fc/82/d3fc823098ece6c1292cc86cc2cdf15b.jpg', deskripsi: 'Lili dikenal dengan kuntum berbentuk terompet yang elegan dan tersedia dalam berbagai warna, termasuk putih, pink, kuning, dan oranye', rating: 4.9),
 Flower(nama: 'Tulip', harga: '100.000', gambarUrl: 'https://i.pinimg.com/564x/b7/21/bb/b721bba323dd1febbe831a705254b14b.jpg', deskripsi: 'Tulip adalah bunga musim semi yang ceria, hadir dalam berbagai macam warna, termasuk merah, pink, kuning, oranye, ungu, dan putih', rating: 4.9),
 Flower(nama: 'Anggrek', harga: '200.000', gambarUrl: 'https://i.pinimg.com/564x/22/86/bc/2286bcde3d464b96ec6cbb882399800b.jpg', deskripsi: 'Anggrek dikenal dengan keindahannya yang eksotis dan kuntum tahan lama. Anggrek hadir dalam berbagai macam warna, termasuk putih, pink, ungu, dan kuning', rating: 4.7),
 Flower(nama: 'Bunga matahari', harga: '70.000', gambarUrl: 'https://i.pinimg.com/564x/d0/53/50/d0535039a720d007e6a64ebb690ee963.jpg', deskripsi: 'Bunga Matahari adalah bunga ceria yang melambangkan kebahagiaan, kekaguman, dan kesetiaan.', rating: 4.6),
];
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('KerinFlorist'),
          titleTextStyle: TextStyle(
              color: Colors.white, fontFamily: 'Poppins', fontSize: 20),
          centerTitle: true,
          backgroundColor: Colors.pink[100],
        ),
        body: ListView.builder(
          itemCount: flowerItems.length,
          itemBuilder: (context, index) {
              Flower item = flowerItems[index];
            return Card(
              margin: EdgeInsets.all(16.0),
              color: Color.fromARGB(240, 127, 38, 121),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      width: 90,
                      height: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: NetworkImage(item.gambarUrl)),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(item.nama, style: TextStyle(fontSize: 18, color: Colors.white)),
                          SizedBox(height: 4),
                          Text(item.deskripsi, style: TextStyle(fontSize: 12, color: Colors.white)),
                          SizedBox(height: 4),
                          Text('Rp ${item.harga}',
                              style: TextStyle(fontSize: 14, color: Colors.white)),
                          SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ...List.generate(5, (index) {
                                if (index < item.rating.toInt()) {
                                  return Icon(Icons.star,
                                      color: Colors.yellow, size: 20);
                                } else {
                                  return Icon(Icons.star_border,
                                      color: Colors.grey, size: 20);
                                }
                              }),
                              SizedBox(width: 5),
                              Text('${item.rating}',
                                  style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}