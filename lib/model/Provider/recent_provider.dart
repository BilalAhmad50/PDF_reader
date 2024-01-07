import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RecentProvider extends ChangeNotifier {
  List<String> _recentDocuments = [];

  List<String> get recentDocuments => _recentDocuments;

  static const String _prefsKey = 'recent_documents';

  RecentProvider() {
    loadRecentDocuments();
  }

  void addRecentDocument(String document) {
    if (!_recentDocuments.contains(document)) {
      _recentDocuments.add(document);
      saveRecentDocuments();
      notifyListeners();
    }
  }

  void removeRecentDocument(String document) {
    _recentDocuments.remove(document);
    saveRecentDocuments();
    notifyListeners();
  }

  void saveRecentDocuments() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_prefsKey, _recentDocuments);
  }

  void loadRecentDocuments() async {
    final prefs = await SharedPreferences.getInstance();
    _recentDocuments = prefs.getStringList(_prefsKey) ?? [];
    notifyListeners();
  }
}
