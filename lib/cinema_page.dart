import 'package:flutter/material.dart';
import 'detail_movie_page.dart';
import 'profile_page.dart';

class CinemaPage extends StatefulWidget {
  const CinemaPage({super.key});

  @override
  State<CinemaPage> createState() => _CinemaPageState();
}

class _CinemaPageState extends State<CinemaPage> {
  int selectedIndex = 1;

  final List<Map<String, String>> daftarFilm = [
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
      "judul": "Spider Man 2",
      "gambar": "assets/images/film1.jpg",
    },
    {
      "judul": "Avengers Endgame",
      "gambar": "assets/images/film2.jpg",
    },
    {
      "judul": "Batman Dark",
      "gambar": "assets/images/film3.jpg",
    },
    {
      "judul": "Joker 2",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff5f5f5),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,

        title: const Text(
          "PRAKTIKUM PAB",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

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

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,

        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });

          // HOME
          if (index == 0) {
            Navigator.pop(context);
          }

          // PROFILE
          else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ProfilePage(),
              ),
            );
          }
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "Movie",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

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