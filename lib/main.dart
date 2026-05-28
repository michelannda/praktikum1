import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Praktikum PAB 2026',
      home: const HomePage(),
    );
  }
}

// ================= HOME PAGE =================
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              const Text(
                "Welcome to",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 5),

              const Text(
                "PRAKTIKUM PAB 2026",
                style: TextStyle(fontSize: 20),
              ),

              const SizedBox(height: 40),

              const Text(
                "1462300042",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30),

              Image.asset(
                "assets/images/profile.jpeg",
                width: 180,
                height: 180,
              ),

              const SizedBox(height: 30),

              const Text(
                "Christina Michela Nanda Erya Kohang",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 50),

              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 15,
                  ),
                ),

                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CinemaPage(),
                    ),
                  );
                },

                child: const Text(
                  "Masuk",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= HALAMAN FILM =================
class CinemaPage extends StatelessWidget {
  const CinemaPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> daftarFilm = [
      {
        "judul": "Spider Man",
        "gambar": "assets/images/film1.jpg",
      },
      {
        "judul": "Avengers",
        "gambar": "assets/images/film2.jpg",
      },
      {
        "judul": "Batman",
        "gambar": "assets/images/film3.jpg",
      },
      {
        "judul": "Joker",
        "gambar": "assets/images/film4.jpg",
      },
      {
        "judul": "Marvel",
        "gambar": "assets/images/film2.jpg",
      },
      {
        "judul": "DC Movie",
        "gambar": "assets/images/film3.jpg",
      },
    ];

    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(
        title: const Text(
          "PRAKTIKUM PAB",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        backgroundColor: Colors.white,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),

        child: GridView.builder(
          itemCount: daftarFilm.length,

          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.72,
          ),

          itemBuilder: (context, index) {
            return movieCard(
              context,
              daftarFilm[index]["judul"]!,
              daftarFilm[index]["gambar"]!,
            );
          },
        ),
      ),
    );
  }

  // CARD FILM
  Widget movieCard(
      BuildContext context,
      String title,
      String image,
      ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMoviePage(
              movieName: title,
              imagePath: image,
            ),
          ),
        );
      },

      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),

              child: Image.asset(
                image,
                height: 120,
                width: 85,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),

              child: Text(
                title,
                textAlign: TextAlign.center,

                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= DETAIL FILM =================
class DetailMoviePage extends StatelessWidget {
  final String movieName;
  final String imagePath;

  const DetailMoviePage({
    super.key,
    required this.movieName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(
        title: Text(movieName),
        backgroundColor: Colors.white,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),

              child: Image.asset(
                imagePath,
                height: 300,
              ),
            ),

            const SizedBox(height: 25),

            Text(
              movieName,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
              ),

              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "$movieName dipilih",
                    ),
                  ),
                );
              },

              child: const Text(
                "Play",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}