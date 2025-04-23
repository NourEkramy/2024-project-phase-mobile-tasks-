import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'itemPicked.dart';

void main() {
  runApp(const ShoeApp());
}

class ShoeApp extends StatelessWidget {
  const ShoeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shoe Details',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
      ),
      home: const ItemsPage(),
    );
  }
}

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, size: 32),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                children: [
                  const CircleAvatar(
                    radius: 24,
                    backgroundColor: Color(0xFFCCCCCC),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'July 14, 2023',
                        style: TextStyle(
                          color: Color(0xFFAAAAAA),
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(height: 2),
                      Row(
                        children: [
                          Text('Hello, ', style: TextStyle(fontSize: 15)),
                          Text(
                            'Yohannes',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11),
                    ),
                    child: const Icon(CupertinoIcons.bell),
                  )
                ],
              ),
              SizedBox(height: 30),

              Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Available Products',
                      style: TextStyle(
                        color: Color(0xFF3E3E3E),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(9),
                    ),
                    child: const Icon(CupertinoIcons.search),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              ProductCard(
                name: "Derby Leather",
                category: "Men's shoe",
                price: 120.0,
                rating: 4.0,
                imagePath: 'assets/Rectangle 28.png',
              ),
              ProductCard(
                name: "Derby Leather",
                category: "Men's shoe",
                price: 120.0,
                rating: 4.0,
                imagePath: 'assets/Rectangle 28.png',
              ),
              ProductCard(
                name: "Derby Leather",
                category: "Men's shoe",
                price: 120.0,
                rating: 4.0,
                imagePath: 'assets/Rectangle 28.png',
              ),
              ProductCard(
                name: "Derby Leather",
                category: "Men's shoe",
                price: 120.0,
                rating: 4.0,
                imagePath: 'assets/Rectangle 28.png',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String name;
  final String category;
  final double price;
  final double rating;
  final String imagePath;

  const ProductCard({
    super.key,
    required this.name,
    required this.category,
    required this.price,
    required this.rating,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ShoeDetailsPage(
              name: name,
              category: category,
              imagePath: imagePath,
              price: price,
              rating: rating,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image.asset(imagePath),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF3E3E3E),
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '\$$price',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF3E3E3E),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Text(
                  category,
                  style: const TextStyle(
                    color: Color(0xFFAAAAAA),
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                const Icon(Icons.star, size: 16, color: Colors.amber),
                const SizedBox(width: 4),
                Text(
                  '(${rating.toStringAsFixed(1)})',
                  style: const TextStyle(
                    color: Color(0xFFAAAAAA),
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
