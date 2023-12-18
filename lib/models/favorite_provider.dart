import 'package:flutter/widgets.dart';
import 'package:tawwon/cloud_functions/database.dart';
import 'package:tawwon/models/donation.dart';

class FavoriteProvider extends ChangeNotifier {
  String? uid;
  FavoriteProvider();
  List<Donation> _favoriteList = [];
  String _userName = '';
  List<Donation> get favoriteList => _favoriteList;
  String get userName => _userName;
  void setUid(String uid) {
    this.uid = uid;
  }

  Future<void> getFavorite() async {
    _favoriteList = await DatabaseService().getWishListOfUser(userId: uid);
  }

  Future<void> getUserName() async {
    final result = await DatabaseService().getUser(uid: uid);
    _userName = result.displayName ?? '';
  }

  Future<void> addFavorite(Donation donation) async {
    await DatabaseService().addItemToWhishList(itemId: donation.id, id: uid);
    _favoriteList.add(donation);
    notifyListeners();
  }

  Future<void> removeFavorite(Donation donation) async {
    await DatabaseService().deleteItemFromWishList(userId: uid, itemId: donation.id);
    _favoriteList.remove(donation);
    notifyListeners();
  }
}
