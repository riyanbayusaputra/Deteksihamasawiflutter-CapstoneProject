import 'package:coba/views/dashboard/berita_panel.dart';

import 'package:coba/views/dashboard/chatbot_panel.dart';

import 'package:coba/views/dashboard/prediksi_panel.dart';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

class BerandaPanel extends StatelessWidget {
  const BerandaPanel({Key? key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _BackgroundDashboard(),
        const _InformasiPengguna(),
        Card(
          margin: const EdgeInsets.fromLTRB(0, 190, 0, 0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10), // Adjusted SizedBox height
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Berita',
                        style: TextStyle(fontSize: 19),
                      ),
                    ],
                  ),
                  _ListBerita(),
                  Wrap(
                    children: [
                      // _TombolMenu(
                      //   gambar: 'assets/icon1.png',
                      //   onTap: () {
                      //     // Navigator.push(
                      //     //   context,
                      //     //   MaterialPageRoute(builder: (c) => const BerandaPanel()),
                      //     // );
                      //   },
                      // ),
                      _TombolMenu(
                        gambar: 'assets/news-reporter.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => const BeritaPanel()),
                          );
                        },
                      ),
                      _TombolMenu(
                        gambar: 'assets/chatbot.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => const ChatBotPanel()),
                          );
                        },
                      ),
                      _TombolMenu(
                        gambar: 'assets/management.png',
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (c) => const Test1()),
                          );
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Bakul Sawi",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: _SawiShopList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class _TombolMenu extends StatelessWidget {
  final String gambar;
  final VoidCallback onTap;

  const _TombolMenu({Key? key, required this.gambar, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(13),
        margin: const EdgeInsets.all(8),
        child: Image.asset(
          gambar,
          width: 40,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color(0xdadadaff),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(125, 112, 158, 158),
              blurRadius: 2,
              spreadRadius: 2,
              offset: Offset(2, 2),
            )
          ],
        ),
      ),
    );
  }
}

class _ListBerita extends StatelessWidget {
  const _ListBerita({Key? key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> daftarBerita = [
      {
        'assetgambar': 'assets/berita1.jpg',
        'judul': 'Tidak Laku di Pasaran: Petani Sawi Menghadapi Krisis',
        'deskripsi':
            'Para petani sawi mengalami masalah serius karena tanaman sawi mereka tidak laku di pasaran. Faktor ekonomi, persaingan dengan tanaman lain, dan kondisi cuaca yang tidak bersahabat menjadi penyebab utama dari krisis ini. Keadaan ini memberikan dampak besar terhadap keberlanjutan usaha pertanian di wilayah tersebut.'
      },
      {
        'assetgambar': 'assets/berita2.jpg',
        'judul': 'Tanaman Sawi Kualitas Rendah: Permintaan Pasar Menurun',
        'deskripsi':
            'Para petani sawi dihadapkan pada tantangan baru ketika tanaman sawi yang dihasilkan memiliki kualitas rendah. Permintaan pasar menurun karena konsumen lebih memilih produk dengan kualitas yang lebih baik. Hal ini menyebabkan tanaman sawi tidak laku di pasaran.'
      },
      {
        'assetgambar': 'assets/berita3.jpg',
        'judul': 'Overproduksi Tanaman Sawi: Pasar Tidak Mampu Menyerap',
        'deskripsi':
            'Fenomena overproduksi terjadi ketika para petani sawi memproduksi lebih banyak dari yang bisa diserap oleh pasar. Kondisi ini menyebabkan penurunan harga dan membuat tanaman sawi tidak laku di pasaran karena ketersediaan yang berlebihan.'
      },
      {
        'assetgambar': 'assets/berita4.jpg',
        'judul': 'Sawi Sehat dan Berkualitas: Petani Raih Kesuksesan',
        'deskripsi':
            'Petani sawi di wilayah tertentu merayakan kesuksesan mereka karena tanaman sawi yang sehat dan berkualitas tinggi. Penerapan praktik pertanian organik dan perawatan tanaman yang cermat telah menghasilkan hasil panen yang luar biasa. Permintaan pasar yang tinggi membuat sawi ini laku keras di pasaran lokal dan ekspor.'
      },
    ];

    return SizedBox(
      width: double.infinity,
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: daftarBerita.length,
        itemBuilder: (context, index) {
          return _ItemBerita(
            assetgambar: daftarBerita[index]['assetgambar']!,
            judulBerita: daftarBerita[index]['judul']!,
            deskripsiBerita: daftarBerita[index]['deskripsi']!,
          );
        },
      ),
    );
  }
}

class _ItemBerita extends StatelessWidget {
  final String assetgambar;
  final String judulBerita;
  final String deskripsiBerita;

  const _ItemBerita(
      {Key? key,
      this.assetgambar = '',
      this.judulBerita = '',
      this.deskripsiBerita = ''});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailBeritaPage(
                assetgambar: assetgambar,
                judulBerita: judulBerita,
                deskripsiBerita: deskripsiBerita,
              ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            assetgambar,
            width: 250,
            height: 130,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class _InformasiPengguna extends StatelessWidget {
  const _InformasiPengguna({Key? key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(22, 60, 22, 10),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              'assets/potoprofil.jpg',
              height: 60,
              width: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'hi, Riyan',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
                Text(
                  'riyanbayu0102@gmail.com',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              // Implementasi aksi saat ikon bel berita di-tap
            },
            child: Image.asset(
              'assets/bell.png',
              width: 30,
            ),
          )
        ],
      ),
    );
  }
}

class _BackgroundDashboard extends StatelessWidget {
  const _BackgroundDashboard({Key? key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/bgs.jpg',
      height: 300,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}

class DetailBeritaPage extends StatelessWidget {
  final String assetgambar;
  final String judulBerita;
  final String deskripsiBerita;

  const DetailBeritaPage({
    Key? key,
    required this.assetgambar,
    required this.judulBerita,
    required this.deskripsiBerita,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Berita Terkini'),
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.green, Colors.teal],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
              tag: 'berita_$assetgambar',
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    assetgambar,
                    height: 200,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                judulBerita,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                deskripsiBerita,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SawiShopList extends StatelessWidget {
  const _SawiShopList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          _buildSawiShop(
            imagePath: "assets/penjual sawi 1.jpg",
            nameShop: "Pasar Brebes",
            rating: "4.8",
            jamBuka: "10.00 - 23.00",
            latitude: -6.8776031, // Replace with actual latitude for Pasar Brebes
            longitude: 109.0266933, // Replace with actual longitude for Pasar Brebes
          
          ),
          _buildSawiShop(
            imagePath: "assets/penjual sawi 2.jpg",
            nameShop: "Pasar Tegal",
            rating: "4.9",
            jamBuka: "13.00 - 23.00",
            latitude: -6.8588488, // Replace with actual latitude for Pasar Pemalang
            longitude: 109.1047665, // Replace with actual longitude for Pasar Pemalang
        
          ),
          _buildSawiShop(
            imagePath: "assets/penjual sawi 3.jpg",
            nameShop: "Pasar Cirebon",
            rating: "4.7",
            jamBuka: "13.00 - 20.00",
            latitude: -6.7281022, // Replace with actual latitude for Pasar Cirebon
            longitude: 108.5078138, // Replace with actual longitude for Pasar Cirebon
          
          ),
          _buildSawiShop(
            imagePath: "assets/penjual sawi 4.jpg",
            nameShop: "Pasar Bondalem",
            rating: "4.7",
            jamBuka: "13.00 - 20.00",
            latitude: -8.1166093, // Replace with actual latitude for Pasar Cirebon
            longitude: 115.3112672, // Replace with actual longitude for Pasar Cirebon
          
          ),
        ],
      ),
    );
  }

  Widget _buildSawiShop({
    required String imagePath,
    required String nameShop,
    required String rating,
    required String jamBuka,
    required double latitude,
    required double longitude,
  }) {
    return SawiShop(
      imagePath: imagePath,
      nameShop: nameShop,
      rating: rating,
      jamBuka: jamBuka,
      latitude: latitude,
      longitude: longitude,
    );
  }
}

class SawiShop extends StatelessWidget {
  final String imagePath;
  final String nameShop;
  final String rating;
  final String jamBuka;
  final double latitude;
  final double longitude;

  const SawiShop({
    Key? key,
    required this.imagePath,
    required this.nameShop,
    required this.rating,
    required this.jamBuka,
    required this.latitude,
    required this.longitude,
  }) : super(key: key);

  void _openGoogleMaps(BuildContext context) async {
    String googleMapsUrl = "https://maps.google.com/?q=$latitude,$longitude";
    try {
      // ignore: deprecated_member_use
      if (await canLaunch(googleMapsUrl)) {
        // ignore: deprecated_member_use
        await launch(googleMapsUrl);
      } else {
        debugPrint('Could not launch $googleMapsUrl');
      }
    } catch (e) {
      debugPrint('Error opening Google Maps: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () => _openGoogleMaps(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nameShop,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      SizedBox(width: 4),
                      Text(rating),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text("Jam Buka: $jamBuka"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


