import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCollections {
  static final _databaseRef = FirebaseFirestore.instance;
  final CollectionReference users = _databaseRef.collection('users');
  final CollectionReference organizations = _databaseRef.collection('organizations');
  final CollectionReference requests = _databaseRef.collection('requests');
}
