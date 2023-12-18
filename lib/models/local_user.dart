class LocalUser {
  // Basic user
  String? uid;
  String? displayName;
  String? number = '';

  LocalUser({
    required this.uid,
    this.displayName,
    this.number,
  });

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'displayName': displayName,
      'number': number,
    };
  }

  factory LocalUser.fromMap(Map<String, dynamic> map) {
    return LocalUser(
      uid: map['uid'],
      displayName: map['displayName'],
      number: map['number'],
    );
  }
}
