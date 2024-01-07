import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteProvider extends ChangeNotifier {
  final List<String> _documents = [];
  List<String> get documents => _documents;

  static const String _prefsKey = 'favorite_documents';

  
  FavoriteProvider() {
    loadFavorites();
  }

  void toggleFavorite(String document) {
    final isExist = _documents.contains(document);
    if (isExist) {
      _documents.remove(document);
    } else {
      _documents.add(document);
    }

    // Save the changes to shared preferences
    saveFavorites();
    notifyListeners();
  }

  void removeFavorite(String document) {
    _documents.remove(document);
    saveFavorites();
    notifyListeners();
  }

  // Method to save favorites to shared preferences
  void saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_prefsKey, _documents);
  }

  // Method to load favorites from shared preferences
  void loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    _documents.clear();
    _documents.addAll(prefs.getStringList(_prefsKey) ?? []);
  }

  // Method to clear favorites from shared preferences
  void clearFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove(_prefsKey);
    _documents.clear();
    notifyListeners();
  }
}
