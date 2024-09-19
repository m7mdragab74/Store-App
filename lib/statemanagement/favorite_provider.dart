import 'package:flutter/material.dart';
import 'package:store_app/database/store_database.dart';

class FavoriteProvider with ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  // Map to store favorite status for each product identified by username and title
  final Map<String, bool> _favoritesMap = {};
  List<Map<String, dynamic>> _favoriteProducts = [];

  List<Map<String, dynamic>> get favoriteProducts => _favoriteProducts;

  /// Check if a specific product is a favorite by combining username and product title
  bool isFavorite(String username, String productTitle) {
    String key = _getKey(username, productTitle);
    return _favoritesMap[key] ?? false;
  }

  /// Toggle the favorite status of a specific product
  Future<void> toggleFavorite(String username, Map<String, dynamic> product) async {
    String key = _getKey(username, product['title']);
    bool currentlyFavorite = _favoritesMap[key] ?? false;

    if (currentlyFavorite) {
      // Remove from favorites if it was already a favorite
      await _dbHelper.removeFavoriteProduct(username, product['title']);
    } else {
      // Add to favorites if it was not a favorite
      await _dbHelper.insertFavoriteProduct(
        username,
        product['title'] as String,
        product['description'] as String,
        product['category'] as String,
        product['image'] as String,
        product['price'] as double,
        product['rating_rate'] as double,
        product['rating_count'] as int,
      );
    }

    // Update the favorite status in the map
    _favoritesMap[key] = !currentlyFavorite;

    // Reload favorites list and notify listeners
    await loadFavoriteProducts(username);
  }

  /// Load all favorite products for a specific user
  Future<void> loadFavoriteProducts(String username) async {
    _favoriteProducts = await _dbHelper.getFavoriteProduct(username);
    
    // Populate the _favoritesMap based on loaded favorites
    for (var product in _favoriteProducts) {
      String key = _getKey(username, product['title']);
      _favoritesMap[key] = true;
    }

    notifyListeners();
  }

  /// Check if a product is a favorite when the product card is created
  Future<void> checkIfFavorite(String username, String productName) async {
    String key = _getKey(username, productName);
    bool favoriteStatus = await _dbHelper.isFavorite(username, productName);
    _favoritesMap[key] = favoriteStatus;
    notifyListeners();
  }

  /// Generate a unique key based on username and product title
  String _getKey(String username, String productTitle) {
    return '$username-$productTitle';
  }
}
