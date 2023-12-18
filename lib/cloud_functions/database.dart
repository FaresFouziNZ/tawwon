import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tawwon/models/donation.dart';
import 'package:tawwon/models/local_user.dart';
import 'package:tawwon/models/wishlist.dart';

import 'firebase_collections.dart';

class DatabaseService {
  late String uid;
  static DatabaseService? _instance;
  final FirebaseCollections collections = FirebaseCollections();
  final storageRef = FirebaseStorage.instance.ref();

  static DatabaseService? get instance {
    _instance ??= DatabaseService();

    return _instance;
  }

  Future createUser({required LocalUser user}) async {
    return await collections.users.doc(user.uid).set(user.toMap(), SetOptions(merge: true));
  }

  Future updateUser({required LocalUser user}) async {
    return await collections.users.doc(user.uid).set(user.toMap(), SetOptions(merge: true));
  }

  Future<LocalUser> getUser({String? uid}) async {
    return await collections.users
        .doc(uid)
        .get()
        .then((value) => LocalUser.fromMap(value.data() as Map<String, dynamic>));
  }

  Future<List<Donation>> getDonations({String? uid}) async {
    List<Donation> donations = [];
    var x = await collections.donates
        .where('donorID', isNotEqualTo: uid)
        .where('isConcluded', isEqualTo: false)
        .get()
        .then((value) => value.docs.map((e) => Donation.fromMap(e.data() as Map<String, dynamic>)).toList());
    donations.addAll(x);
    return donations;
  }

  Future uploadPicture({required File file}) async {
    try {
      return await storageRef.child(file.path).putFile(file);
    } catch (e) {}
  }

  Future createDonation({required Donation donation, required File file}) async {
    TaskSnapshot uploaded = await uploadPicture(file: file);
    donation.imageUrl = await uploaded.ref.getDownloadURL();
    return await collections.donates.add(donation.toMap()).then((value) async {
      await collections.donates.doc(value.id).update({'id': value.id});
    });
  }

  Future<List<Donation>> getDonationsFilteredByCategory({required String filter, String? userId}) async {
    List<Donation> donations = [];
    var x = await collections.donates
        .where('category', isEqualTo: filter)
        .where('isConcluded', isEqualTo: false)
        .where('donorID', isNotEqualTo: userId)
        .get()
        .then((value) => value.docs.map((e) => Donation.fromMap(e.data() as Map<String, dynamic>)).toList());
    donations.addAll(x);
    return donations;
  }

  Future<List<Donation>> getDonationsSearch({required String searchQuery, String? uid}) async {
    return await collections.donates
        .where('name', isGreaterThanOrEqualTo: searchQuery)
        .where('name', isLessThan: '$searchQuery\uf8ff')
        .where('isConcluded', isEqualTo: false)
        // .where('donorID', isNotEqualTo: uid)
        .get()
        .then((value) => value.docs.map((e) => Donation.fromMap(e.data() as Map<String, dynamic>)).toList());
  }

  Future<List<Donation>> getWishListOfUser({String? userId}) async {
    final x = await collections.wishlist.doc(userId).get();

    WishList wishList = WishList.fromMap(x.data() as Map<String, dynamic>);
    List<Donation> donations = [];
    for (var i = 0; i < wishList.items.length; i++) {
      var x = await collections.donates.doc(wishList.items[i]).get();
      donations.add(Donation.fromMap(x.data() as Map<String, dynamic>));
    }
    return donations;
  }

  Future addItemToWhishList({String? id, String? itemId}) {
    return collections.wishlist.doc(id).set({
      'items': FieldValue.arrayUnion([itemId])
    }, SetOptions(merge: true));
  }

  Future searchResults({required String query}) {
    return collections.donates.where('name', isEqualTo: query).get();
  }

  Future<List<Donation>> getUserItems({String? uid}) async {
    List<Donation> donations = [];
    var x = await collections.donates
        .where('donorID', isEqualTo: uid)
        .get()
        .then((value) => value.docs.map((e) => Donation.fromMap(e.data() as Map<String, dynamic>)).toList());
    donations.addAll(x);
    return donations;
  }

  Future deleteItem({String? itemId}) async {
    await collections.wishlist.get().then((value) {
      value.docs.forEach((element) async {
        await collections.wishlist.doc(element.id).update({
          'items': FieldValue.arrayRemove([itemId])
        });
      });
    });
    return await collections.donates.doc(itemId).delete();
  }

  Future deleteItemFromWishList({String? itemId, String? userId}) async {
    return await collections.wishlist.doc(userId).update({
      'items': FieldValue.arrayRemove([itemId])
    });
  }

  Future<List<Donation>> getNewDonations({String? uid}) async {
    List<Donation> donations = [];
    var x = await collections.donates
        .where('createdAt',
            isGreaterThanOrEqualTo: DateTime.now().subtract(const Duration(days: 7)).millisecondsSinceEpoch)
        .where('isConcluded', isEqualTo: false)
        .get()
        .then((value) => value.docs.map((e) => Donation.fromMap(e.data() as Map<String, dynamic>)).toList());
    for (var i = 0; i < x.length; i++) {
      if (x[i].donorID != uid) {
        donations.add(x[i]);
      }
    }
    return donations;
  }

  Future<List<Donation>> getDonationsForUser({String? uid}) async {
    List<Donation> donations = [];
    var x = await collections.donates
        .where('donorID', isEqualTo: uid)
        .where('isConcluded', isEqualTo: false)
        .get()
        .then((value) => value.docs.map((e) => Donation.fromMap(e.data() as Map<String, dynamic>)).toList());
    donations.addAll(x);
    return donations;
  }
}
