// import 'package:flutter/foundation.dart';
// import 'package:hive/hive.dart';

// part "favorite_provider.g.dart";

// @HiveType(typeId: 1)
// class FavoriteProvider extends HiveObject with ChangeNotifier {
//   @HiveField(0)
//   List<String> documents = [];

//   void toggleFavorite(String document) {
//     final isExist = documents.contains(document);
//     if (isExist) {
//       documents.remove(document);
//     } else {
//       documents.add(document);
//     }

//     // Save the changes to Hive
//     save();
//   }

//   // Method to save the object to Hive
//   void save() async {
//     await saveHiveObject(this);
//     notifyListeners();
//   }
// }
