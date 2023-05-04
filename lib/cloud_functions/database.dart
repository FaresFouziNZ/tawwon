import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tawwon/models/local_user.dart';
import 'package:tawwon/models/organization.dart';
import 'package:tawwon/models/request.dart';

import 'firebase_collections.dart';

class DatabaseService {
  late String uid;
  static DatabaseService? _instance;
  final FirebaseCollections collections = FirebaseCollections();

  static DatabaseService? get instance {
    _instance ??= DatabaseService();

    return _instance;
  }

  Future createUser({required LocalUser user}) async {
    return await collections.users.doc(user.uid).set(user.toMap(), SetOptions(merge: true));
  }

  Future createOrganization({required Organization organization}) {
    return collections.organizations.add(organization.toMap());
  }

  Future createRequest({required Request request}) async {
    return await collections.requests.add(request.toMap());
  }

  Future<Organization> getOrganizationDetails({required String? uid}) async {
    return await collections.organizations.doc(uid).get().then((value) {
      if (value.data() == null) {
        return Organization(description: '', name: '', uid: '', logoUrl: '', time: '', types: []);
      }
      return Organization.fromMap(value.data() as Map<String, dynamic>);
    });
  }

  Future<Organization> getOrganizationByName({required String? name}) async {
    return await collections.organizations
        .where('name', isEqualTo: name)
        .get()
        .then((value) => Organization.fromMap(value.docs.first.data() as Map<String, dynamic>));
  }

  Future<List<Organization>> getOrganizations() {
    return collections.organizations.get().then((value) {
      return value.docs.map((e) => Organization.fromMap(e.data() as Map<String, dynamic>)).toList();
    });
  }
}
