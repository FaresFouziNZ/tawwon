class Donation {
  String? category;
  String? donorID;
  String? imageUrl;
  String? name;
  String? phoneNumber;
  String? description;
  String? location;
  String? id;
  bool? isConcluded;
  int? createdAt;

  Donation({
    this.category,
    this.donorID,
    this.imageUrl,
    this.name,
    this.phoneNumber,
    this.description,
    this.location,
    this.id,
    this.isConcluded,
    this.createdAt,
  });

  factory Donation.fromMap(Map<String, dynamic> json) => Donation(
        category: json['category'].toString().toLowerCase(),
        donorID: json['donorID'],
        imageUrl: json['imageUrl'],
        name: json['name'].toString().toLowerCase(),
        phoneNumber: json['phoneNumber'],
        description: json['description'],
        location: json['location'],
        id: json['id'],
        isConcluded: json['isConcluded'],
        createdAt: json['createdAt'],
      );

  Map<String, dynamic> toMap() => {
        'category': category?.toLowerCase(),
        'donorID': donorID,
        'imageUrl': imageUrl,
        'name': name?.toLowerCase(),
        'phoneNumber': phoneNumber,
        'description': description,
        'location': location,
        'id': id,
        'isConcluded': isConcluded,
        'createdAt': createdAt,
      };
}
