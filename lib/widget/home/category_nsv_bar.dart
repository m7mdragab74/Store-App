import 'package:flutter/material.dart';

class CategoryNavBar extends StatelessWidget {
  final Function(String) onCategorySelected;
  final String categorySelected;

  CategoryNavBar({
    Key? key,
    required this.onCategorySelected,
    required this.categorySelected,
  }) : super(key: key);

  Widget _buildCategoryItem(String category) {
    bool isSelected = categorySelected == category;

    return GestureDetector(
      onTap: () => onCategorySelected(category),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey[800], // Highlight background if selected
          borderRadius: BorderRadius.circular(20), // Rounded edges
        ),
        child: Center(
          child: Text(
            category,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white, // Text color change on selection
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildCategoryItem('All'),
          _buildCategoryItem('Men'),
          _buildCategoryItem('Women'),
          _buildCategoryItem('Electronics'),
          _buildCategoryItem('Jewelery'),
        ],
      ),
    );
  }
}
