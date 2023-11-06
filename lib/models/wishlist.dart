class WhishList {
  final String uid;
  final List<String> items;

  WhishList({required this.uid, required this.items});

  factory WhishList.fromMap(Map<String, dynamic> map) {
    return WhishList(uid: map['uid'], items: List<String>.from(map['items']));
  }

  Map<String, dynamic> toMap() {
    return {'uid': uid, 'items': items};
  }
}
