class LocalUser {
  // Basic user
  String? uid;
  String? displayName;

  LocalUser({
    required this.uid,
     this.displayName,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
    };
  }

  factory LocalUser.fromMap(Map<String, dynamic> map) {
    if (map == null) return LocalUser(uid: '', displayName: '');
    return LocalUser(
      uid: map['uid'],
      displayName: map['displayName'],
    );
  }
}
