import 'package:flutter/material.dart';

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
            Image.asset(
              imagePath,
              height: 300,
            ),

            const SizedBox(height: 20),

            Text(
              movieName,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},

              child: const Text("Play"),
            ),
          ],
        ),
      ),
    );
  }
}