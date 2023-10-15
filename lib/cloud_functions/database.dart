import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tawwon/models/donation.dart';
import 'package:tawwon/models/local_user.dart';

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

  // Future createOrganization({required Organization organization}) {
  //   return collections.organizations.doc(organization.uid).set(organization.toMap(), SetOptions(merge: true));
  // }

  // Future createRequest({required Request request}) async {
  //   return await collections.requests.add(request.toMap());
  // }

  // Future<Organization> getOrganizationDetails({required String? uid}) async {
  //   return await collections.organizations.doc(uid).get().then((value) {
  //     print('a');
  //     if (value.data() == null) {
  //       return collections.organizations.where('uid', isEqualTo: uid).get().then((value) {
  //         print('b');
  //         if (value.docs.isEmpty) {
  //           return Organization(description: '', name: '', uid: '', logoUrl: '', time: '', types: []);
  //         }
  //         return Organization.fromMap(value.docs.first.data() as Map<String, dynamic>);
  //       });
  //     }
  //     // var x = value.data();
  //     // print(x);
  //     return Organization.fromMap(value.data() as Map<String, dynamic>);
  //   });
  // }

  // Future<Organization> getOrganizationByName({required String? name}) async {
  //   return await collections.organizations
  //       .where('name', isEqualTo: name)
  //       .get()
  //       .then((value) => Organization.fromMap(value.docs.first.data() as Map<String, dynamic>));
  // }

  // Future<List<Organization>> getOrganizations() {
  //   return collections.organizations.get().then((value) {
  //     return value.docs.map((e) => Organization.fromMap(e.data() as Map<String, dynamic>)).toList();
  //   });
  // }

  // Future<List<Request>> getRequestsByUid({required String? uid}) async {
  //   if (uid == null) {
  //     return [];
  //   }
  //   List<Request> requests = [];
  //   var x = await collections.requests
  //       .where('donorID', isEqualTo: uid)
  //       .get()
  //       .then((value) => value.docs.map((e) => Request.fromMap(e.data() as Map<String, dynamic>)).toList());
  //   requests.addAll(x);
  //   x = await collections.requests
  //       .where('organizationID', isEqualTo: uid)
  //       .get()
  //       .then((value) => value.docs.map((e) => Request.fromMap(e.data() as Map<String, dynamic>)).toList());
  //   requests.addAll(x);
  //   return requests;
  // }

  Future<List<Donation>> getDonations() async {
    List<Donation> donations = [];
    var x = await collections.donates
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
    return await collections.donates.add(donation.toMap());
  }
}
