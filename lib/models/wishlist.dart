class WishList {
  final List<String> items;

  WishList({required this.items});

  factory WishList.fromMap(Map<String, dynamic> map) {
    return WishList(items: List<String>.from(map['items']));
  }

  Map<String, dynamic> toMap() {
    return {'items': items};
  }
}
