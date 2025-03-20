import 'package:flutter/material.dart';

import '../models/category_model.dart';
import 'category_card.dart';

class CategoriesListView extends StatelessWidget {
  const CategoriesListView({super.key});

  final List<CategoryModel> categories = const [
    CategoryModel(
      image:
          'assets/contemporary-building-exterior-skyscraper-design-concept.jpg',
      categoryName: 'Business',
    ),
    CategoryModel(
      image: 'assets/entertaiment.avif',
      categoryName: 'Entertainment',
    ),
    CategoryModel(image: 'assets/health.avif', categoryName: 'Health'),
    CategoryModel(image: 'assets/science.avif', categoryName: 'Science'),
    CategoryModel(image: 'assets/technology.jpeg', categoryName: 'Technology'),
    CategoryModel(image: 'assets/sports-tools.jpg', categoryName: 'Sports'),
    CategoryModel(
      image: 'assets/red-light-round-podium-black-background-mock-up.jpg',
      categoryName: 'General',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 85,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return CategoryCard(category: categories[index]);
        },
      ),
    );
  }
}
